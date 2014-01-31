//
//  CustomNavigation.m
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "CustomNavigation.h"

@interface CustomNavigation ()

@end

@implementation CustomNavigation
@synthesize lbl_title;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.lbl_title = [[UILabel alloc]initWithFrame:CGRectMake(135, 30, 90, 30)];
    self.lbl_title.backgroundColor = [UIColor clearColor];
    self.lbl_title.textColor = [UIColor whiteColor];
    [self.view addSubview:self.lbl_title];
    
    dashBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [dashBtn setFrame:CGRectMake(15,25, 30, 30)];
    dashBtn.backgroundColor = [UIColor whiteColor];
    [dashBtn addTarget:self action:@selector(dashBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dashBtn];
    
}

-(void)dashBtnClicked:(id) sender
{
   
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
