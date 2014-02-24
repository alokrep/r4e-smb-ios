//
//  SlideViewController.h
//  Reputation
//
//  Created by jai sharma on 2/1/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"
#import "TourViewController.h"


@interface SlideViewController : UIViewController
{

    TourViewController * tourObj;
}
@property (weak, nonatomic) IBOutlet UIButton *btnSettings;
- (IBAction)settingBtnClicked:(id)sender;
- (IBAction)HomeBtnClicked:(id)sender;

@end
