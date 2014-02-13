//
//  FullReviewViewController.h
//  Reputation
//
//  Created by arun kumar on 2/6/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mobile.h"
#import "StarRatingView.h"

@interface FullReviewViewController : UIViewController
{
    StarRatingView* starview;
    
}
@property (weak, nonatomic) IBOutlet UIButton *imgVw_logoIcon;
@property (weak, nonatomic) IBOutlet UILabel *lbl_date;
@property (weak, nonatomic) IBOutlet UILabel *lbl_name;
@property (strong, nonatomic) IBOutlet UITextView *textView_fullReview;
@property (strong, nonatomic) IBOutlet UIView *view_Bottom;
@property (strong, nonatomic) Review * reviewObj;

@end
