//
//  CustomTabBarView.m
//  Reputation
//
//  Created by jai sharma on 2/4/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "CustomTabBarView.h"
#import "TabBarControllerClass.h"


@interface CustomTabBarView ()

@end

@implementation CustomTabBarView

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
    [btn_dashBoard setImage:[UIImage imageNamed:@"dashboard_sel.png"] forState:UIControlStateNormal];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tabBarAction:(id)sender {
    
    [btn_dashBoard setImage:[UIImage imageNamed:@"dashboard.png"] forState:UIControlStateNormal];
    [btn_reviews setImage:[UIImage imageNamed:@"reviews.png"] forState:UIControlStateNormal] ;
    [btn_social setImage:[UIImage imageNamed:@"social.png"] forState:UIControlStateNormal] ;
    [btn_score setImage:[UIImage imageNamed:@"score.png"] forState:UIControlStateNormal] ;
    
    switch ([sender tag]) {
        case 0:
            [btn_dashBoard setImage:[UIImage imageNamed:@"dashboard_sel.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [btn_reviews setImage:[UIImage imageNamed:@"reviews_sel.png"] forState:UIControlStateNormal] ;
            break;
        case 2:
            [btn_social setImage:[UIImage imageNamed:@"social_sel.png"] forState:UIControlStateNormal] ;
            break;
        case 3:
            [btn_score setImage:[UIImage imageNamed:@"score_sel.png"] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    
    [[AppDelegate sharedDelegate].tabBarControllerObj customTabDidSelect:[sender tag]];
    
    
}
@end
