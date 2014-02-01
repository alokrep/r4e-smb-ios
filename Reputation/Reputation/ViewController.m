//
//  ViewController.m
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signInBtnAction:(id)sender
{
    [self performSegueWithIdentifier:@"GoToSlider" sender:nil];

}

#pragma mark TextField Delegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
}
@end
