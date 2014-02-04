//
//  CustomNavigation.m
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "CustomNavigation.h"
#import "AppDelegate.h"
#import "TabBarControllerClass.h"

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
    
    self.navigationBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"NavBar.png"]];
	
    UIImageView * imageTopBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, -20, 320, 64)];
    imageTopBar.image = [UIImage imageNamed:@"NavBar.png"];
    
    [self.navigationBar addSubview:imageTopBar];
    
    self.lbl_title = [[UILabel alloc]initWithFrame:CGRectMake(100, 30,120, 30)];
    self.lbl_title.backgroundColor = [UIColor clearColor];
    self.lbl_title.textColor = [UIColor whiteColor];
    self.lbl_title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lbl_title];
    
    dashBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [dashBtn setImage:[UIImage imageNamed:@"list.png"] forState:UIControlStateNormal];
    [dashBtn setFrame:CGRectMake(15,25, 30, 30)];
    dashBtn.backgroundColor = [UIColor clearColor];
    [dashBtn addTarget:self action:@selector(dashBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dashBtn];
    
}

-(void)dashBtnClicked:(id) sender
{
    [self slideLeft];
}
-(void)slideLeft
{
    [self.slidingViewController anchorTopViewTo:ECRight];
    
}
/*
{
    CGRect frameTemp = self.view.frame;
    
    
    
    if (dashBtn.tag==0) {
        frameTemp.origin.x +=250;
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             
                             self.view.frame = frameTemp;
                             
                         }
                         completion:^(BOOL finished){
                             dashBtn.tag = 1;
                             
                             
                         }];
    }
    else
    {
        
        
        
    frameTemp.origin.x -=250;
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.view.frame = frameTemp;
                         
                     }
                     completion:^(BOOL finished){
                         dashBtn.tag = 0;
                     }];
    
    }
}
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
