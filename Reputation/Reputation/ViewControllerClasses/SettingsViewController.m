//
//  SettingsViewController.m
//  Reputation
//
//  Created by jai sharma on 2/1/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "SettingsViewController.h"
#import "ViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    navigationObj.lbl_title.text = @"Settings";
    self.view.backgroundColor = [UIColor colorWithRed:235.0f/255.0f green:235.0f/255.0f blue:242.0f/255.0f alpha:1.0];
    self.txtFld_email.text = [AppDelegate sharedDelegate].userObj.email;
    self.txtFld_password.text = @"12434556";
    NSLog(@"%@",[AppDelegate sharedDelegate].userObj.password);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if (![self.txtFld_email.text isEqualToString:[AppDelegate sharedDelegate].userObj.email])
    {
        ViewController * viewObj = [self.slidingViewController.navigationController.viewControllers objectAtIndex:0];
        viewObj.str_changedEmail = textField.text;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:nil forKey:kUserInfo];
        [prefs synchronize];
        [self.slidingViewController.navigationController popToRootViewControllerAnimated:YES];
        
    }
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
}
@end
