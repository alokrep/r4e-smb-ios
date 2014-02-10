//
//  ViewController.h
//  Reputation
//
//  Created by Jai Sharma  on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>
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
#import "LoginServiceModal.h"

@interface ViewController : UIViewController<WebDelegate>
{
    BOOL  emailValid;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imgVw_BackGround;
@property (weak, nonatomic) IBOutlet UIButton *signInBtn;
@property (weak, nonatomic) IBOutlet UITextField *txtFld_userName;
@property (weak, nonatomic) IBOutlet UITextField *txtFld_password;
- (IBAction)signInBtnAction:(id)sender;

@end
