//
//  TabBarControllerClass.h
//  Reputation
//
//  Created by Jai.Sharma  on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideViewController.h"
#import "AppDelegate.h"
#import "CustomTabBarView.h"

@interface TabBarControllerClass : UITabBarController
{
    CustomTabBarView * customTabViewObj;
    TourViewController *    tourObj;
}
-(void)customTabDidSelect:(int )tag;
@property(nonatomic,strong) SlideViewController * slideObj;
@end
