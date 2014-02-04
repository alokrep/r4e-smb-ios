//
//  ScoreController.m
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "ScoreController.h"
#import "CustomNavigation.h"

@interface ScoreController ()

@end

@implementation ScoreController

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
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    navigationObj.lbl_title.text = @"Score";
    
self.view.backgroundColor = [UIColor colorWithRed:234.0f/255.0f green:234.0f/255.0f blue:234.0f/255.0f alpha:1.0];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)factorsBtnClicked:(id)sender {
    
    switch ([sender tag]) {
        case 0:
            [self.imgVw_varientArrow setFrame:CGRectMake(42, 238, self.imgVw_varientArrow.frame.size.width,  self.imgVw_varientArrow.frame.size.height)];
            break;
        case 1:
            [self.imgVw_varientArrow setFrame:CGRectMake(153, 238, self.imgVw_varientArrow.frame.size.width,  self.imgVw_varientArrow.frame.size.height)];
            break;
        case 2:
           [self.imgVw_varientArrow setFrame:CGRectMake(250, 238, self.imgVw_varientArrow.frame.size.width,  self.imgVw_varientArrow.frame.size.height)];
            break;
        case 3:
            [self.imgVw_varientArrow setFrame:CGRectMake(42, 328, self.imgVw_varientArrow.frame.size.width,  self.imgVw_varientArrow.frame.size.height)];
            break;
        case 4:
            [self.imgVw_varientArrow setFrame:CGRectMake(153,328, self.imgVw_varientArrow.frame.size.width,  self.imgVw_varientArrow.frame.size.height)];
            break;
        case 5:
            [self.imgVw_varientArrow setFrame:CGRectMake(250, 328, self.imgVw_varientArrow.frame.size.width,  self.imgVw_varientArrow.frame.size.height)];
            break;
            
        default:
            break;
    }
}
@end
