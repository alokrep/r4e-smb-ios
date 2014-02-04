//
//  filterTimeViewController.m
//  Reputation
//
//  Created by arun kumar on 2/4/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "filterTimeViewController.h"

@interface filterTimeViewController ()

@end

@implementation filterTimeViewController

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
    
    
    
    [[self.textViewFilterTime layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.textViewFilterTime layer] setBorderWidth:.5];
    [[self.textViewFilterTime layer] setCornerRadius:4];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end