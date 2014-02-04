//
//  CustomTabBarView.h
//  Reputation
//
//  Created by jai sharma on 2/4/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface CustomTabBarView : UIViewController
{
    __weak IBOutlet UIButton *btn_dashBoard;
    
    __weak IBOutlet UIButton *btn_reviews;
    __weak IBOutlet UIButton *btn_social;
    
    __weak IBOutlet UIButton *btn_score;
    
}
- (IBAction)tabBarAction:(id)sender;

@end
