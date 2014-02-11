//
//  ViewController.m
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "ViewController.h"
#import "DEJOwareActivityIndicatorView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadIndicatorView];
    if ([AppDelegate sharedDelegate].userObj) {
        [self performSegueWithIdentifier:@"GoToSlider" sender:nil];
    }
    
    
    self.txtFld_userName.text = @"alok.damireddy+1@reputation.com";
    self.txtFld_password.text = @"51190bad0";
	
    
}
-(void)loadIndicatorView
{
    activityIndicatorView = [[DEJOwareActivityIndicatorView alloc]
							 initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray
							 text:@"Loading..."
							 superview:self.view];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signInBtnAction:(id)sender
{
   
    if (self.txtFld_userName.text.length>0 && self.txtFld_password.text.length>0) {
       
        [self validateEmail:self.txtFld_userName.text];
        
        if (!emailValid) {
            UIAlertView *emailAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Please enter valid E-mail address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [emailAlert show];
            
            return;
        }
        
        
        [activityIndicatorView startAnimating];
        self.view.userInteractionEnabled = NO;
        LoginServiceModal * loginObj = [[LoginServiceModal alloc]init];
        loginObj.delegate = self;
        
        [loginObj callLoginWebservice:self.txtFld_userName.text :self.txtFld_password.text];
        
                 //[self callLoginWebservice:self.txtFld_userName.text:self.txtFld_password.text];
        
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
-(void)webResponse:(id )details
{
    
    NSString * str_response = (NSString *)details;
    
    if ([str_response isEqualToString:@"success"]) {
        [self performSegueWithIdentifier:@"GoToSlider" sender:nil];
    }
    else
        
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Login Failed" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    [activityIndicatorView stopAnimating];
    self.view.userInteractionEnabled = YES;
    

    
}
#pragma mark TextField Delegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
}
@end
