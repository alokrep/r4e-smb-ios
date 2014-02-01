//
//  TabBarControllerClass.m
//  Reputation
//
//  Created by Jai.Sharma on  1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "TabBarControllerClass.h"


@interface TabBarControllerClass ()

@end

@implementation TabBarControllerClass
@synthesize slideObj;
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
	
    self.slideObj = [[SlideViewController alloc]initWithNibName:@"SlideViewController" bundle:Nil];
    
    [AppDelegate sharedDelegate].tabBarControllerObj = self;
    
    [[AppDelegate sharedDelegate].window addSubview:slideObj.view];
    [[AppDelegate sharedDelegate].window sendSubviewToBack:slideObj.view];
    
    //[self.view addSubview:slideObj.view];
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[SlideViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftView"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (self.selectedIndex==3) {
        //[viewController.tabBarItem setImage:[UIImage ima]]
        
    }
    
    
    
}
@end
