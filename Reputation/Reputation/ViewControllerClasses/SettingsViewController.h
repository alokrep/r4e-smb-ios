//
//  SettingsViewController.h
//  Reputation
//
//  Created by jai sharma on 2/1/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"CustomNavigation.h"

@interface SettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lbl_email;
@property (weak, nonatomic) IBOutlet UITextField *txtFld_password;
@property (weak, nonatomic) IBOutlet UITextField *txtFld_email;

@end
