//
//  SlideViewController.m
//  Reputation
//
//  Created by jai sharma on 2/1/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "SlideViewController.h"
#import "AppDelegate.h"
#import "TabBarControllerClass.h"

@interface SlideViewController ()

@end

@implementation SlideViewController

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
    [self.slidingViewController setAnchorRightRevealAmount:244.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)tempBtnAction:(id)sender
{
    
    
    
   // self.tabBarController.view = settingsObj.view;
    
}
- (IBAction)settingBtnClicked:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"OpenSettings" object:nil];
    
}

- (IBAction)HomeBtnClicked:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"OpenTabs" object:nil];
    
    
}
@end
