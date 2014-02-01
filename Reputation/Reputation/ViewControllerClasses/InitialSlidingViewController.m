//
//  InitialSlidingViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/25/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "InitialSlidingViewController.h"
#import "AppDelegate.h"
#import "TabBarControllerClass.h"
@implementation InitialSlidingViewController

- (void)viewDidLoad {
  [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showSettings:) name:@"OpenSettings" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showTabs:) name:@"OpenTabs" object:nil];
       _storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    UINavigationController *objTabbar = [_storyBoard instantiateViewControllerWithIdentifier:@"TabBar"];
    self.topViewController = objTabbar;
    objSettingNC = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingNC"];

}

-(void)showSettings:(NSNotification *)notification
{
    self.topViewController =objSettingNC;
    [self resetTopView];
    
}
-(void)showTabs:(NSNotification *)notification
{
    self.topViewController =[AppDelegate sharedDelegate].tabBarControllerObj;
    [self resetTopView];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
  return YES;
}
-(void)viewDidUnload
{
    self.navigationController.navigationBarHidden = NO;

}
-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;

}
@end
