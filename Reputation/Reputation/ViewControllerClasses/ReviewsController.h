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
#import "IconDownloader.h"
#import "ReviewDashBoardModal.h"
#import "MBProgressHUD.h"
#import "RespondViewController.h"


@interface ReviewsController : UIViewController

{
    IBOutlet UITableView *tbl_View;
    FullReviewViewController *objFullViewController;
    
    RespondViewController * respondObj;
    
     UIActionSheet *actionSheetReview;
    UIButton *btn_getReviews;
    UIBarButtonItem *barBtn;
}
@property (nonatomic, strong) NSMutableDictionary *imageDownloadsInProgress;
@property (weak, nonatomic) IBOutlet UITableView *tblVw_review;
@property(nonatomic,strong) SearchFilter * searchFilterInst;
@property(nonatomic,strong) NSMutableArray * arr_ReviewData;
@property(nonatomic,strong) NSMutableArray * arr_logoImages;
-(IBAction)btn_arrow:(id)sender;
-(void)getReviewsFeedByFilter: (SearchFilter *) searchFilter;
@end
