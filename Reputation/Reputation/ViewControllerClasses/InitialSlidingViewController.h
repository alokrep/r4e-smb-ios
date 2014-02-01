//
//  InitialSlidingViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/25/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "ECSlidingViewController.h"
#import "SettingsViewController.h"
#import "CustomNavigation.h"
@interface InitialSlidingViewController : ECSlidingViewController
{
    CustomNavigation *objSettingNC;

}
@property (nonatomic,strong) UIStoryboard *storyBoard;


@end
