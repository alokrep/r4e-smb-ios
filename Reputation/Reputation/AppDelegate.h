//
//  AppDelegate.h
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobileAuth.h"
@class TabBarControllerClass;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic) TabBarControllerClass * tabBarControllerObj;
@property(strong,nonatomic) User * userObj;

+(AppDelegate *)sharedDelegate;
- (void)removeFunctionalityOfAutoLayoutForView:(UIView*)view forController:(UIViewController*)viewController;
- (void)removeFunctionalityOfAutoLayoutForLabel:(UILabel*)kindOfView forController:(UIViewController*)viewController;
- (void)removeFunctionalityOfAutoLayoutForImageView:(UIImageView*)kindOfView forController:(UIViewController*)viewController;



@end
