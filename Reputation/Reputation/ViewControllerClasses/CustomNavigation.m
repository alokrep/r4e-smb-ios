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
@synthesize reviewsBtn;
@synthesize dashBtn;
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
    
    [self addBackButton];
    [self addReviewsButton];
    self.backBtn.hidden = YES;
    self.reviewsBtn.hidden = YES;
    
    self.refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.refreshBtn setImage:[UIImage imageNamed:@"refreshBtn.png"] forState:UIControlStateNormal];
    [self.refreshBtn setFrame:CGRectMake(275,25, 30, 30)];
    self.refreshBtn.backgroundColor = [UIColor clearColor];
    self.refreshBtn.hidden = YES;
    [self.view addSubview:self.refreshBtn];
    
    self.dashBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.dashBtn setImage:[UIImage imageNamed:@"list.png"] forState:UIControlStateNormal];
    [self.dashBtn setFrame:CGRectMake(15,25, 30, 30)];
    self.dashBtn.backgroundColor = [UIColor clearColor];
    [self.dashBtn addTarget:self action:@selector(dashBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.dashBtn];
    
}

-(void) addBackButton
{
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.backBtn setImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];
    [self.backBtn setFrame:CGRectMake(10,25, 60, 30)];
    self.backBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.backBtn];
    
}

-(void) addReviewsButton
{
    self.reviewsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.reviewsBtn setImage:[UIImage imageNamed:@"get_reviews.png"] forState:UIControlStateNormal];
    [self.reviewsBtn setFrame:CGRectMake(230,30, 80, 25)];
    self.reviewsBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.reviewsBtn];
    
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
