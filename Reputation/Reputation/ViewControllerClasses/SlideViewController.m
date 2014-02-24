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
    tourObj = [[TourViewController alloc]initWithNibName:@"TourViewController" bundle:Nil];
    
}
# pragma mark IBAction Methods
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
-(IBAction)helpBtnClicked:(id)sender
{
     tourObj.view.frame = CGRectMake(0, 0, 320,568);
    
    
    [[AppDelegate sharedDelegate].window addSubview:tourObj.view];
    [[AppDelegate sharedDelegate].window bringSubviewToFront:tourObj.view];
    
}
@end
