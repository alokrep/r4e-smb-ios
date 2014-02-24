//
//  AppDelegate.m
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarControllerClass.h"
#import <Crashlytics/Crashlytics.h>
#import "UAirship.h"
#import "UAConfig.h"
#import "UAPush.h"

@implementation AppDelegate
@synthesize tabBarControllerObj;
@synthesize userObj;
+(AppDelegate *)sharedDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    //Adding crashlytics
    [Crashlytics startWithAPIKey:@"df3e594a408c25737d475b00660679bfd7f3aeda"];
    
    // This prevents the UA Library from registering with UIApplication by default. This will allow
    // you to prompt your users at a later time. This gives your app the opportunity to explain the
    // benefits of push or allows users to turn it on explicitly in a settings screen.
    //
    // If you just want everyone to immediately be prompted for push, you can
    // leave this line out.
    //[UAPush setDefaultPushEnabledValue:NO];
    
    // Set log level for debugging config loading (optional)
    // It will be set to the value in the loaded config upon takeOff
    [UAirship setLogLevel:UALogLevelTrace];
    
    // Populate AirshipConfig.plist with your app's info from https://go.urbanairship.com
    // or set runtime properties here.
    UAConfig *config = [UAConfig defaultConfig];
    
    // You can also programmatically override the plist values:
    // config.developmentAppKey = @"YourKey";
    // etc.
    [[UAPush shared] setAutobadgeEnabled:YES];
    
    // Call takeOff (which creates the UAirship singleton)
    [UAirship takeOff:config];
    
    // Set the icon badge to zero on startup (optional)
    [[UAPush shared] resetBadge];
    
    // Sets the alias. It will be sent to the server on registration.
    //NSString *yourAlias = @"alok.damireddy+1@reputation.com";
    NSString *yourAlias = @"";
    [UAPush shared].alias = nil;
    
    // Set the icon badge to zero on startup (optional)
    //[[UAPush shared] resetBadge];
    
    self.userObj = [self loadUserObjectWithKey:kUserInfo];
    
    return YES;
}
							
-(void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

-(void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    // Set the icon badge to zero on resume (optional)
    [[UAPush shared] resetBadge];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    UA_LINFO(@"Received remote notification (in appDelegate): %@", userInfo);
    
    // Optionally provide a delegate that will be used to handle notifications received while the app is running
    // [UAPush shared].pushNotificationDelegate = your custom push delegate class conforming to the UAPushNotificationDelegate protocol
    
    // Reset the badge after a push received (optional)
    [[UAPush shared] resetBadge];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    UA_LINFO(@"Received remote notification (in appDelegate): %@", userInfo);
    
    // Optionally provide a delegate that will be used to handle notifications received while the app is running
    // [UAPush shared].pushNotificationDelegate = your custom push delegate class conforming to the UAPushNotificationDelegate protocol
    
    // Reset the badge after a push is received in a active or inactive state
    if (application.applicationState != UIApplicationStateBackground) {
        [[UAPush shared] resetBadge];
    }
    
    completionHandler(UIBackgroundFetchResultNoData);
}

// Implement the iOS device token registration callback
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    UALOG(@"APN device token: %@", deviceToken);
    
    // Updates the device token and registers the token with UA. This won't occur until
    // push is enabled if the outlined process is followed.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.userObj = [self loadUserObjectWithKey:kUserInfo];
    
    if(self.userObj != Nil) {
        NSString *alias = [NSString stringWithFormat:@"%d", self.userObj.id];
        [UAPush shared].alias = alias;
    }
    [[UAPush shared] registerDeviceToken:deviceToken];
    [[UAPush shared] updateRegistration];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
-(User *)loadUserObjectWithKey:(NSString*)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [prefs objectForKey:kUserInfo ];
    User *obj = (User *)[NSKeyedUnarchiver unarchiveObjectWithData:myEncodedObject];
    return obj;
}
- (void) removeFunctionalityOfAutoLayoutForView:(UIView*)kindOfView forController:(UIViewController*)viewController
{
    
    UIView* view = (UIView*)kindOfView;
    [view removeFromSuperview];
    [view setTranslatesAutoresizingMaskIntoConstraints:YES];
    [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y,view.frame.size.width, view.frame.size.height)];
    [viewController.view addSubview:view];
}


- (void) removeFunctionalityOfAutoLayoutForLabel:(UILabel*)kindOfView forController:(UIViewController*)viewController
{
    UILabel* view = (UILabel*)kindOfView;
    [view removeFromSuperview];
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y,view.frame.size.width, view.frame.size.height)];
    [viewController.view addSubview:view];
    
}

- (void) removeFunctionalityOfAutoLayoutForImageView:(UIImageView*)kindOfView forController:(UIViewController*)viewController
{
    UIImageView* view = (UIImageView*)kindOfView;
    [view removeFromSuperview];
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y,view.frame.size.width, view.frame.size.height)];
    [viewController.view addSubview:view];
    
}

@end
