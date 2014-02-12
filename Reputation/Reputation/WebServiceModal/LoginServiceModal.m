//
//  LoginServiceModal.m
//  Reputation
//
//  Created by jai sharma on 2/7/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "LoginServiceModal.h"

@implementation LoginServiceModal
-(void)callLoginWebservice:(NSString *)email :(NSString *)password
{
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(queue, ^{
        
       
        
        NSURL *loginEndpointURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@login",kServiceURL]];
        THMACHttpClient *httpClient = [[THMACHttpClient alloc] initWithURL:loginEndpointURL userId:email secret:@"reputation"];
        TBinaryProtocol *protocol = [[TBinaryProtocol alloc] initWithTransport:httpClient strictRead:YES strictWrite:YES];
        MobileAuthClient *service = [[MobileAuthClient alloc] initWithProtocol:protocol];
        LoginResponse *resp = [service login:email password:password];
        
        NSLog(@"resp%@",resp);
        if(resp.response.responseCode == ResponseCode_Success) {
            
           
            [self saveUserObject:resp.userDetails];
            
            [AppDelegate sharedDelegate].userObj = [self loadUserObjectWithKey:kUserInfo];
            
            
            NSLog(@"userKey%@",resp.userDetails.userKey);
            
            //            THMACHttpClient *httpTwoClient = [[THMACHttpClient alloc] initWithURL:[NSURL URLWithString:kServiceURL] userId:@"alok.damireddy+1@reputation.com" secret:@"-364253313"];
//            THMACHttpClient *httpTwoClient = [[THMACHttpClient alloc] initWithURL:[NSURL URLWithString:kServiceURL] userId:resp.userDetails.email secret:resp.userDetails.userKey];
//            
//            TBinaryProtocol *protocol2 = [[TBinaryProtocol alloc] initWithTransport:httpTwoClient strictRead:YES strictWrite:YES];
//            MobileClient *serviceTwo = [[MobileClient alloc] initWithProtocol:protocol2];
//            @try {
//                
//                FeedResponse *revFeedResp = [serviceTwo getReviewsFeed:0 start:0 pageCount:40 searchCriteria:nil];
//                if(revFeedResp.response.responseCode == ResponseCode_Success) {
//                    NSLog(@"revFeedResp.items %@",revFeedResp.items);
//                }
//                
//                SummaryResponse *summResp = [serviceTwo getSummary];
//                if(summResp.response.responseCode == ResponseCode_Success) {
//                    NSLog(@"summResp.aggregates %@",summResp.aggregates);
//                }
//            }
//            @catch (NSException * e) {
//                NSLog(@"Exception: %@", e);
//            }
//            @finally {
//                // Added to show finally works as well
//            }
//            
        }
        
        
        //NSLog(@"resp%@",resp);
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
             if(resp.response.responseCode == ResponseCode_Success) {
            
                 [self.delegate webResponse:@"success"];
             }
            else
            {
                [self.delegate webResponse:resp.response.error.message];
                
            }
        });
        
    });
    
    
    
}
-(void)saveUserObject:(User *)userObj
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:userObj];
    [prefs setObject:myEncodedObject forKey:kUserInfo];
    [prefs synchronize];
}
-(User *)loadUserObjectWithKey:(NSString*)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [prefs objectForKey:kUserInfo ];
    User *obj = (User *)[NSKeyedUnarchiver unarchiveObjectWithData:myEncodedObject];
    return obj;
}

@end
