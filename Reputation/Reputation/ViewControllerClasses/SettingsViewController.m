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
    
    
    if (self.txtFld_email.text.length>0 && self.txtFld_password.text.length>0) {
        
    
    
        if ([textField isEqual:self.txtFld_password]) {
            
        
    
    if (![self.txtFld_email.text isEqualToString:[AppDelegate sharedDelegate].userObj.email])
    {
       
        
    }
    else
    {
        [self validateEmail:self.txtFld_email.text];
        if (!emailValid) {
            UIAlertView *emailAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Please enter valid E-mail address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [emailAlert show];
            
            return;
        }
        
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        LoginServiceModal * loginObj = [[LoginServiceModal alloc]init];
        loginObj.delegate = self;
        
        [loginObj callLoginWebservice:self.txtFld_email.text :self.txtFld_password.text];

        
    }
        
        
    }
    }
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
}


-(void)webResponse:(id )details
{
    
    NSString * str_response = (NSString *)details;
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    if ([str_response isEqualToString:@"success"]) {
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"OpenTabs" object:nil];
    }
    else
        
    {
        ViewController * viewObj = [self.slidingViewController.navigationController.viewControllers objectAtIndex:0];
        viewObj.str_changedEmail = self.txtFld_email.text;
        [viewObj showEditedCredentials:self.txtFld_email.text :self.txtFld_password.text];
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:nil forKey:kUserInfo];
        [prefs synchronize];
        [self.slidingViewController.navigationController popToRootViewControllerAnimated:YES];
    }
    
    
    
    
    
}


- (BOOL)validateEmail:(NSString *)candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if (candidate.length <=0) {
        emailValid = TRUE;
    }
    
    else if ([emailTest evaluateWithObject:candidate] == YES){
        NSLog(@"matched");
        emailValid = TRUE;
    }
    else
    {
        emailValid = FALSE;
        NSLog(@"not matched");
    }
    return YES;
}

@end
