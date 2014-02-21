//
//  TabBarControllerClass.m
//  Reputation
//
//  Created by Jai.Sharma on  1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "TabBarControllerClass.h"
#import "TourViewController.h"


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
	
    //self.slideObj = [[SlideViewController alloc]initWithNibName:@"SlideViewController" bundle:Nil];
    
    customTabViewObj = [[CustomTabBarView alloc]initWithNibName:@"CustomTabBarView" bundle:Nil];
    [customTabViewObj.view setFrame:CGRectMake(0,0,320, 49)];
     [self.tabBar addSubview:customTabViewObj.view];
    [AppDelegate sharedDelegate].tabBarControllerObj = self;
    self.selectedIndex = 0;
    
   // [[AppDelegate sharedDelegate].window addSubview:slideObj.view];
    //[[AppDelegate sharedDelegate].window sendSubviewToBack:slideObj.view];
    NSUserDefaults * prefs = [NSUserDefaults standardUserDefaults];
    
    if (![[prefs objectForKey:@"FirstLaunch"] isEqualToString:@"YES"]) {
        
           tourObj = [[TourViewController alloc]initWithNibName:@"TourViewController" bundle:Nil];
        tourObj.view.frame = CGRectMake(0, 0, 320,self.view.frame.size.height);
        [prefs setObject:@"YES" forKey:@"FirstLaunch"];
        [prefs synchronize];
        
        [[AppDelegate sharedDelegate].window addSubview:tourObj.view];
        [[AppDelegate sharedDelegate].window bringSubviewToFront:tourObj.view];
        
    }

    
    
    
    
    
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
-(void)customTabDidSelect:(int )tag
{
    
    self.selectedIndex = tag;
    
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (self.selectedIndex==3) {
        //[viewController.tabBarItem setImage:[UIImage ima]]
        
    }
    
    
    
}
@end
