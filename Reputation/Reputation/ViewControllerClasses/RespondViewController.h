//
//  RespondViewController.h
//  Reputation
//
//  Created by arun kumar on 2/20/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobileCommon.h"
#import "THMACHttpClient.h"
#import "TBinaryProtocol.h"
#import "Mobile.h"
#import "MobileAuth.h"
#import "MBProgressHUD.h"

@interface RespondViewController : UIViewController<UITextViewDelegate>

@property(strong,nonatomic) NSString * str_reviewID;
@property(strong,nonatomic) Review * reviewObj;
@property(nonatomic) BOOL isForwarded;
@property (weak, nonatomic) IBOutlet UITextView *txtViewRespond;
@property (weak, nonatomic) IBOutlet UITextField *txtFldEmail;


@end
