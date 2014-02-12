//
//  ReviewsController.m
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "ReviewsController.h"
#import "CustomNavigation.h"
#import "reviewsTableViewCell.h"
#import "filterTableViewController.h"

#import "FullReviewViewController.h"


#define kLabelAllowance 70.0f
#define kStarViewHeight 18.0f
#define kStarViewWidth  80.0f
#define kLeftPadding     0.0f
#define kRightPadding    -40.0f

@interface ReviewsController ()<UIActionSheetDelegate>

@end

@implementation ReviewsController
@synthesize arr_ReviewData;
#pragma mark View LifeCycle
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
    navigationObj.lbl_title.text = @"Reviews";
    objFullViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"FullReview"];
    
    [self getReviewsData];
}
- (void)viewWillAppear:(BOOL)animated
{
    
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    navigationObj.navigationBarHidden = NO;
    
    navigationObj.dashBtn.hidden = NO;
    navigationObj.lbl_title.hidden =  NO;
    navigationObj.reviewsBtn.hidden = NO;
    navigationObj.backBtn.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
    
    
    
    navigationObj.lbl_title.text = @"Reviews";
    
    // navigationObj.dashBtn.hidden = NO;
    
    btn_getReviews = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_getReviews.frame = CGRectMake(0, 0, 100, 25);
    // btn_getReviews.backgroundColor = [UIColor greenColor];
    [btn_getReviews setImage:[UIImage imageNamed:@"get_reviews.png"] forState:UIControlStateNormal];
    
    [btn_getReviews addTarget:self action:@selector(moveTORateView) forControlEvents:UIControlEventTouchUpInside];
    
    barBtn = [[UIBarButtonItem alloc] initWithCustomView:btn_getReviews];
    
    self.navigationItem.rightBarButtonItem = barBtn;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) moveTORateView
{
    //[self performSegueWithIdentifier:@"CustomSegue" sender:self];
    
    
    
    
    
    [self performSegueWithIdentifier:@"ratingView" sender:self];
    
    //[self performSegueWithIdentifier:@"presentSegue" sender:self];
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"reviewCell";
    static NSString *CellIdentifier1 = @"filterCell";
    
    
    if(indexPath.row == 0)
    {
        UITableViewCell *cellFilter = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
        if(cellFilter == nil)
        {
            cellFilter = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
            
            cellFilter.textLabel.text = @"Filter";
            cellFilter.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cellFilter.selectionStyle=UITableViewCellSelectionStyleNone;
        }
        return cellFilter;
    }
    reviewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Review * review = (Review *)[self.arr_ReviewData objectAtIndex:indexPath.row];
    
    
    if(cell == nil)
    {
        cell = (reviewsTableViewCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.btn_DropDown.tag = indexPath.row;
    cell.lbl_comment.text = review.comment;
    cell.lbl_date.text = review.date;
    int rating = review.rating;
    cell.lbl_rating.text = [NSString stringWithFormat:@"%d.0/5.0",rating];
    cell.lbl_name.text = review.reviewerName;
    CGSize expectedLabelSize_city =  [review.reviewerName sizeWithFont:cell.lbl_name.font constrainedToSize:CGSizeMake(MAXFLOAT, cell.lbl_name.frame.size.height) lineBreakMode:NSLineBreakByWordWrapping];
    CGRect frameForName =cell.lbl_name.frame;
    
    frameForName.size.width = expectedLabelSize_city.width+4;
    cell.lbl_name.frame=frameForName;
    
    CGRect frame = cell.lbl_date.frame;
    
    frame.origin.x = cell.lbl_name.frame.origin.x+expectedLabelSize_city.width+12;
    cell.lbl_date.frame = frame;
    
    CGRect frameFordot =cell.img_dot.frame;
    
    frameFordot.origin.x =cell.lbl_name.frame.origin.x+expectedLabelSize_city.width+5;
    cell.img_dot.frame=frameFordot;

    //5720
    StarRatingView* starview = [[StarRatingView alloc]initWithFrame:CGRectMake(57,10, kStarViewWidth+kLabelAllowance+kLeftPadding+kRightPadding, kStarViewHeight) andRating:20 withLabel:YES animated:NO];
    
    
    switch (rating) {
        case 0:
            starview.userRating = 0;
            starview.rating = 0;
            starview.label.text = @"0.0";
            break;
        case 1:
            starview.userRating = 20;
            starview.rating = starview.userRating;
            starview.label.text = @"1.0";
            break;
        case 2:
            starview.userRating = 40;
             starview.rating = starview.userRating;
            starview.label.text = @"2.0";
            break;
        case 3:
            starview.userRating = 60;
             starview.rating = starview.userRating;
            break;
        case 4:
            starview.userRating = 80;
             starview.rating = starview.userRating;
            break;
        case 5:
            starview.userRating = 100;
             starview.rating = starview.userRating;
            break;
            
        default:
            break;
    }
    
    
    [starview ratingDidChange];
    
    [cell.contentView addSubview:starview];
    
    
    if (indexPath.row%2 == 0) {
        cell.backgroundColor = [UIColor whiteColor];
    }
    else
    {
        cell.backgroundColor = [UIColor colorWithRed:251.0/255.0 green:235.0/255.0 blue:239.0/255.0 alpha:1];
    }
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return self.arr_ReviewData.count;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        
    }
    else
    {
    actionSheetReview = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Reply",@"Full View",@"Mark as Read",@"Email Review",@"Share", nil];
        [actionSheetReview showInView:self.view];
    }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
        return 44;
    
    else
        return 178;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */
-(void)getReviewsData
{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_async(queue, ^{
        
      
        THMACHttpClient *httpTwoClient = [[THMACHttpClient alloc] initWithURL:[NSURL URLWithString:kServiceURL] userId:[AppDelegate sharedDelegate].userObj.email secret:[AppDelegate sharedDelegate].userObj.userKey];
        
        TBinaryProtocol *protocol2 = [[TBinaryProtocol alloc] initWithTransport:httpTwoClient strictRead:YES strictWrite:YES];
           MobileClient *serviceTwo = [[MobileClient alloc] initWithProtocol:protocol2];
        
        FeedResponse *revFeedResp = [serviceTwo getReviewsFeed:0 start:0 pageCount:40 searchCriteria:nil];
        
        
        if(revFeedResp.response.responseCode == ResponseCode_Success) {
            NSLog(@"revFeedResp.items %@",revFeedResp.items);
        
           // Review * review = [revFeedResp.items objectAtIndex:0];
            
            self.arr_ReviewData = revFeedResp.items;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (arr_ReviewData.count>0) {
                
                [self.tblVw_review reloadData];
            }
            
        });
        
    });
    

}

//[self performSegueWithIdentifier:@"filterVC" sender:self];
#pragma mark Button Method
- (IBAction)btn_arrow:(id)sender {
    NSIndexPath *indexPath = [tbl_View indexPathForCell:(reviewsTableViewCell *)
                              [[[sender superview] superview] superview]];
    NSLog(@"The row id is %d",  indexPath.row);
    
    actionSheetReview = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Reply",@"Full View",@"Mark as Read",@"Email Review",@"Share", nil];
    [actionSheetReview showInView:self.view];
    
}
#pragma mark ActionSheet Delegates Method
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Full View"])
    {
       
        [self.navigationController pushViewController:objFullViewController animated:YES];
    }
    
}


@end
