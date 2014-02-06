//
//  FullReviewViewController.m
//  Reputation
//
//  Created by arun kumar on 2/6/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "FullReviewViewController.h"
#import "StarRatingView.h"

#define kLabelAllowance 70.0f
#define kStarViewHeight 18.0f
#define kStarViewWidth  80.0f
#define kLeftPadding     0.0f
#define kRightPadding    -40.0f

@interface FullReviewViewController ()

@end

@implementation FullReviewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	StarRatingView* starview = [[StarRatingView alloc]initWithFrame:CGRectMake(45,20, kStarViewWidth+kLabelAllowance+kLeftPadding+kRightPadding, kStarViewHeight) andRating:80 withLabel:YES animated:NO];
    [self.view addSubview:starview];
    
    _textView_fullReview.textAlignment = NSTextAlignmentJustified;
    self.view_Bottom.layer.borderWidth = .5f;
    self.view_Bottom.layer.borderColor = [[UIColor colorWithRed:195.0/255.0f green:195.0/255.0f blue:195.0/255.0f alpha:1] CGColor];
    
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    [navigationObj.backBtn addTarget:self action:@selector(popTORateView) forControlEvents:UIControlEventTouchUpInside];
    
   
    
}
- (void)viewWillAppear:(BOOL)animated
{
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    
    navigationObj.dashBtn.hidden = YES;
    navigationObj.backBtn.hidden = NO;
    navigationObj.reviewsBtn.hidden = YES;
}
-(void) popTORateView
{
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    [navigationObj popViewControllerAnimated:YES];
    
}
-(IBAction)backBtnClicked:(id)sender
{
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
