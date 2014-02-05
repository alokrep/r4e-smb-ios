/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

#import "THMACHTTPClient.h"
#import "TTransportException.h"
#import "TObjective-C.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import "Base64.h"

@implementation THMACHttpClient


- (void) setupRequest
{
    if (mRequest != nil) {
        [mRequest release_stub];
    }
    
    // set up our request object that we'll use for each request
    mRequest = [[NSMutableURLRequest alloc] initWithURL: mURL];
    [mRequest setHTTPMethod: @"POST"];
    [mRequest setValue: @"application/x-thrift" forHTTPHeaderField: @"Content-Type"];
    [mRequest setValue: @"application/x-thrift" forHTTPHeaderField: @"Accept"];
    
    NSString * userAgent = mUserAgent;
    if (!userAgent) {
        userAgent = @"Cocoa/THTTPClient";
    }
    [mRequest setValue: userAgent forHTTPHeaderField: @"User-Agent"];
    
    [mRequest setCachePolicy: NSURLRequestReloadIgnoringCacheData];
    if (mTimeout) {
        [mRequest setTimeoutInterval: mTimeout];
    }
   
    
}

- (void) setHMACHeaders
{
    NSString * md5 = [self calculateMD5Data:mRequestData];
    //NSLog(@"MD5 %@", md5);
    NSMutableString *toSign = [NSMutableString stringWithString:@""];
    [ toSign appendString:[mRequest.HTTPMethod lowercaseString]];
    [ toSign appendString:@"\n"];
    [ toSign appendString:md5];
    [ toSign appendString:@"\n"];
    [ toSign appendString:@"application/x-thrift"];
    [ toSign appendString:@"\n"];
    [ toSign appendString:[@"currDate" lowercaseString]];
    [ toSign appendString:@"\n"];
    [ toSign appendString:mURL.path];
    //NSLog(@"toSign %@", toSign);
    NSString *hmac = [self calculateHMAC:toSign];
    //NSLog(@"HMAC %@", hmac);
    [toSign setString:mUserId];
    [toSign appendString:@":"];
    [toSign appendString:hmac];
    
    [mRequest setValue: toSign forHTTPHeaderField: @"hmac"];
    [mRequest setValue: @"currDate" forHTTPHeaderField: @"Date"];
    [mRequest setValue: md5 forHTTPHeaderField: @"Content-Md5"];
    
}

- (id) initWithURL: (NSURL *) aURL
            userId: (NSString *) userId
            secret: (NSString *) secret
{
    return [self initWithURL: aURL
                   userAgent: nil
                     timeout: 0
                      userId:userId
                      secret: secret
                    ];
}


- (id) initWithURL: (NSURL *) aURL
         userAgent: (NSString *) userAgent
           timeout: (int) timeout
            userId: (NSString *) userId
            secret: (NSString *) secret
{
    self = [super init];
    if (!self) {
        return nil;
    }
    mUserId = userId;
    mSecret = secret;
    mTimeout = timeout;
    if (userAgent) {
        mUserAgent = [userAgent retain_stub];
    }
    mURL = [aURL retain_stub];
    
    [self setupRequest];
    
    // create our request data buffer
    mRequestData = [[NSMutableData alloc] initWithCapacity: 1024];
    
    return self;
}

- (void) setURL: (NSURL *) aURL
{
    [aURL retain_stub];
    [mURL release_stub];
    mURL = aURL;
    
    [self setupRequest];
}

- (NSString*) calculateHMAC: (NSString *) fields
{
    NSData *saltData = [mSecret dataUsingEncoding:NSUTF8StringEncoding];
    NSData *paramData = [fields dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData* hash = [NSMutableData dataWithLength:CC_SHA256_DIGEST_LENGTH ];
    CCHmac(kCCHmacAlgSHA256, saltData.bytes, saltData.length, paramData.bytes, paramData.length, hash.mutableBytes);
    NSString *base64Hash = [hash base64EncodedString];
    return base64Hash;
}

- (NSString*) calculateMD5Data: (NSData *) requestPayload
{
    //NSLog(@"mRequestData length %@", requestPayload.length);
    // Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(requestPayload.bytes, requestPayload.length, md5Buffer);
    
    // Convert unsigned char buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i] ];
    NSString *lower = [output lowercaseString];
    NSString *encoded= [lower base64EncodedString];
    return [encoded lowercaseString];
}

- (void) dealloc
{
    [mURL release_stub];
    [mUserAgent release_stub];
    [mRequest release_stub];
    [mRequestData release_stub];
    [mResponseData release_stub];
    [mUserId release_stub];
    [mSecret release_stub];
    [super dealloc_stub];
}


- (int) readAll: (uint8_t *) buf offset: (int) off length: (int) len
{
    NSRange r;
    r.location = mResponseDataOffset;
    r.length = len;
    
    [mResponseData getBytes: buf+off range: r];
    mResponseDataOffset += len;
    
    return len;
}


- (void) write: (const uint8_t *) data offset: (unsigned int) offset length: (unsigned int) length
{
    [mRequestData appendBytes: data+offset length: length];
}


- (void) flush
{
    [mRequest setHTTPBody: mRequestData]; // not sure if it copies the data

    //Add HMAC Headers
    [self setHMACHeaders];
    
    // make the HTTP request
    NSURLResponse * response;
    NSError * error;
    NSData * responseData =
    [NSURLConnection sendSynchronousRequest: mRequest returningResponse: &response error: &error];
    
    [mRequestData setLength: 0];
    
    if (responseData == nil) {
        @throw [TTransportException exceptionWithName: @"TTransportException"
                                               reason: @"Could not make HTTP request"
                                                error: error];
    }
    if (![response isKindOfClass: [NSHTTPURLResponse class]]) {
        @throw [TTransportException exceptionWithName: @"TTransportException"
                                               reason: [NSString stringWithFormat: @"Unexpected NSURLResponse type: %@",
                                                        NSStringFromClass([response class])]];
    }
    
    NSHTTPURLResponse * httpResponse = (NSHTTPURLResponse *) response;
    if ([httpResponse statusCode] != 200) {
        @throw [TTransportException exceptionWithName: @"TTransportException"
                                               reason: [NSString stringWithFormat: @"Bad response from HTTP server: %d",
                                                        [httpResponse statusCode]]];
    }
    
    // phew!
    [mResponseData release_stub];
    mResponseData = [responseData retain_stub];
    mResponseDataOffset = 0;
}


@end
