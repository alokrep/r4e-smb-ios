//
//  TourViewController.m
//  Reputation
//
//  Created by jai sharma on 2/4/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "TourViewController.h"

@interface TourViewController ()

@end

@implementation TourViewController

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
    self.scrollVw.contentSize = CGSizeMake(1280,323);
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
