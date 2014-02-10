//
//  LoginServiceModal.h
//  Reputation
//
//  Created by jai sharma on 2/7/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mobile.h"
#import "TProtocol.h"
#import "TApplicationException.h"
#import "TProtocolUtil.h"
#import "TProcessor.h"
#import "TObjective-C.h"
#import "TTransport.h"
#import "THMACHttpClient.h"
#import "TBinaryProtocol.h"
#import "MobileAuth.h"

@protocol WebDelegate
@required
-(void)webResponse:(id )details;
@end

@interface LoginServiceModal : NSObject
@property(nonatomic , assign)  id<WebDelegate> delegate;
-(void)callLoginWebservice:(NSString *)email :(NSString *)password;
@end
