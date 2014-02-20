//
//  CustomNavigation.h
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNavigation : UINavigationController

{
    UIButton * dashBtn;
    
}
@property (nonatomic,strong) UIButton * dashBtn;
@property (nonatomic,strong) UIButton * cancelBtn;
@property (nonatomic,strong) UIButton * sendBtn;
@property (nonatomic,strong) UIButton * backBtn;
@property (nonatomic,strong) UIButton * reviewsBtn;
@property (nonatomic,strong) UIButton * refreshBtn;

@property (nonatomic,strong)UILabel * lbl_title;

@end
