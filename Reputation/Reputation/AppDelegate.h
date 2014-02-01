//
//  AppDelegate.h
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TabBarControllerClass;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic) TabBarControllerClass * tabBarControllerObj;


+(AppDelegate *)sharedDelegate;
@end
