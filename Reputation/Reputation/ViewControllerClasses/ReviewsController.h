//
//  ReviewsController.h
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FullReviewViewController.h"
#import "THMACHttpClient.h"
#import "TBinaryProtocol.h"
#import "Mobile.h"
#import "MobileAuth.h"
#import "StarRatingView.h"


@interface ReviewsController : UIViewController

{
    IBOutlet UITableView *tbl_View;
    FullReviewViewController *objFullViewController;
    
    
     UIActionSheet *actionSheetReview;
    UIButton *btn_getReviews;
    UIBarButtonItem *barBtn;
}
@property (weak, nonatomic) IBOutlet UITableView *tblVw_review;
@property(nonatomic,strong) NSMutableArray * arr_ReviewData;
-(IBAction)btn_arrow:(id)sender;
@end
