//
//  ReviewsController.m
//  Reputation
//
//  Created by Jai Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "ReviewsController.h"
#import "CustomNavigation.h"
#import "reviewsTableViewCell.h"


#import "FullReviewViewController.h"


#define kLabelAllowance 70.0f
#define kStarViewHeight 18.0f
#define kStarViewWidth  80.0f
#define kLeftPadding     0.0f
#define kRightPadding    -40.0f

@interface ReviewsController ()<UIActionSheetDelegate>
{
    NSMutableDictionary *dictResponse ;
}
@end


int startIndex;
@implementation ReviewsController
@synthesize arr_ReviewData;
@synthesize arr_logoImages;
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
     dictResponse = [NSMutableDictionary dictionary];
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
     respondObj  = [self.storyboard instantiateViewControllerWithIdentifier:@"respondVC"];
    navigationObj.lbl_title.text = @"Reviews";
    objFullViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"FullReview"];
    
    self.arr_ReviewData = [[NSMutableArray alloc]init];
    self.arr_logoImages = [[NSMutableArray alloc]init];
    [self.arr_logoImages addObject:@""];
    
    startIndex = 0;
    
   
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
    
    
    startIndex = 0;
    
    [self getReviewsData:startIndex];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSArray *allDownloads = [self.imageDownloadsInProgress allValues];
    [allDownloads makeObjectsPerformSelector:@selector(cancelDownload)];
    
    [self.imageDownloadsInProgress removeAllObjects];
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
            //cellFilter.selectionStyle=UITableViewCellSelectionStyleNone;
        }
        cellFilter.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return cellFilter;
    }
    reviewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Review * review = (Review *)[self.arr_ReviewData objectAtIndex:indexPath.row-1];
    
    
    
    if(cell == nil)
    {
        cell = (reviewsTableViewCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.btn_DropDown.tag = indexPath.row;
    cell.lbl_comment.text = review.comment;
    cell.lbl_date.text = review.date;
    int rating = review.normalizedRating;
    cell.btn_DropDown.tag = indexPath.row;
    [cell.btn_DropDown addTarget:self action:@selector(btn_arrow:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //Setting DynamicFrame
    
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
    
    cell.btn_forward.tag = indexPath.row;
    cell.btn_readMore.tag = indexPath.row;
    cell.btn_reply.tag = indexPath.row;
    
    [cell.btn_readMore addTarget:self action:@selector(readMoreBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.btn_reply addTarget:self action:@selector(replyBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.btn_forward addTarget:self action:@selector(forwardBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //5720
    
    for (id obj in cell.contentView.subviews) {
        
        if ([obj isKindOfClass:[StarRatingView class]]) {
            
            StarRatingView * star = (StarRatingView *)obj;
            [star removeFromSuperview];
        }
    }
    StarRatingView* starview = [[StarRatingView alloc]initWithFrame:CGRectMake(57,10, kStarViewWidth+kLabelAllowance+kLeftPadding+kRightPadding, kStarViewHeight) andRating:20 withLabel:YES animated:NO];
    
    starview.userInteractionEnabled = NO;
    
    NSLog(@"rate %d",rating);
    
    switch (rating) {
        case 0:
            starview.userRating = 0;
            starview.rating = starview.userRating;
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
            starview.label.text = @"3.0";
            break;
        case 4:
            starview.userRating = 80;
             starview.rating = starview.userRating;
            starview.label.text = @"4.0";
            break;
        case 5:
            starview.userRating = 100;
             starview.rating = starview.userRating;
            starview.label.text = @"5.0";
            break;
            
        default:
            break;
    }
    
    
    [starview ratingDidChange];
    
    [cell.contentView addSubview:starview];
    starview = nil;
    
    
    if (indexPath.row%2 == 0) {
        cell.backgroundColor = [UIColor whiteColor];
    }
    else
    {
        cell.backgroundColor = [UIColor colorWithRed:251.0/255.0 green:235.0/255.0 blue:239.0/255.0 alpha:1];
    }
    
    NSLog(@"koisk %@",review.sourceId);
    
    if ([review.sourceId isEqualToString:@"SURVEY"]) {
        
        NSLog(@"%d",review.nps);
        
        NSString * str = [NSString stringWithFormat:@"nps_%d.png",review.nps];
        cell.img_logoIcon.image = [UIImage imageNamed:str];
    }
    else
    {
        
        ReviewDashBoardModal  * reviewObj = [self.arr_logoImages objectAtIndex:indexPath.row];
        
        
        
        if (!reviewObj.logoIcon)
        {
            if (self.tblVw_review.dragging == NO && self.tblVw_review.decelerating == NO)
            {
                [self startIconDownload:reviewObj forIndexPath:indexPath];
            }
            // if a download is deferred or in progress, return a placeholder image
            cell.img_logoIcon.image = [UIImage imageNamed:@"Placeholder.png"];
        }
        else
        {
            cell.img_logoIcon.image = reviewObj.logoIcon;
        }
  
    }
    
    NSMutableArray *arrResponse = [[NSMutableArray alloc ]init];
    Review * reviewObj = [self.arr_ReviewData objectAtIndex:indexPath.row];
    for (int respIndx = 0; respIndx < reviewObj.allowedActions.count; respIndx++)
    {
        
        NSString *strResponse = [reviewObj.allowedActions objectAtIndex:respIndx];
        NSString *strTitles = [strResponse substringWithRange:NSMakeRange(16, [strResponse length]-16)];
        strTitles = [self sentenceCapitalizedString:strTitles];
        [arrResponse addObject:strTitles];
        
    }
    
    cell.btn_reply.hidden = YES;
    cell.btn_forward.hidden = YES;
    [dictResponse setObject:arrResponse forKey:[NSString stringWithFormat:@"%i",indexPath.row]];
    
    
    NSString *strreply =@"reply";
    
    NSPredicate *predtemp =[NSPredicate predicateWithFormat:@"SELF beginsWith[cd] %@",strreply];
    NSArray *arr_finalResponsetemp =[arrResponse filteredArrayUsingPredicate:predtemp];
    
    if (arr_finalResponsetemp.count>0) {
        cell.btn_reply.hidden = NO;
    }
    

    
    NSString *str =@"forward";
    NSLog(@"titles = %@",arrResponse);
    
    NSPredicate *pred =[NSPredicate predicateWithFormat:@"SELF beginsWith[cd] %@",str];
    NSArray *arr_finalResponse =[arrResponse filteredArrayUsingPredicate:pred];
    NSLog(@"%@",arr_finalResponse);
    
    
    
    
    if (arr_finalResponse.count>0) {
       
    
    
             cell.btn_forward.hidden = NO;
            if (cell.btn_reply.hidden) {
               
                cell.imgView_dotForward.hidden = YES;
                
                CGRect frame = cell.btn_forward.frame;
                frame.origin.x = cell.btn_reply.frame.origin.x;
                cell.btn_forward.frame = frame;
            }
            else
            {
                CGRect frame = cell.btn_forward.frame;
                frame.origin.x = 163;
                 cell.btn_forward.frame = frame;
                cell.imgView_dotForward.hidden = NO;
                
                
            }
            
    }
    
    
       return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return self.arr_ReviewData.count+1;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSArray * arrTemp = [self.tblVw_review indexPathsForVisibleRows];
    NSLog(@"%@",arrTemp);

    if (arrTemp.count>0) {
        
        NSIndexPath * index= [arrTemp lastObject];
        
        if (index.row >self.arr_ReviewData.count-8) {
            
            if (startIndex<self.arr_ReviewData.count) {
                startIndex = self.arr_ReviewData.count+1;
                NSLog(@"count %d",startIndex);
                
                [self getReviewsData:startIndex];
            }
           
        }
    }

}
//- (NSArray *)indexPathsForVisibleRows
//{
//    
//    
//    
//}

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

#pragma mark Call Reviews API

-(void)getReviewsData:(int )startPoint
{
    
    
     [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_async(queue, ^{
        
      
        THMACHttpClient *httpTwoClient = [[THMACHttpClient alloc] initWithURL:[NSURL URLWithString:kServiceURL] userId:[AppDelegate sharedDelegate].userObj.email secret:[AppDelegate sharedDelegate].userObj.userKey];
        
        TBinaryProtocol *protocol2 = [[TBinaryProtocol alloc] initWithTransport:httpTwoClient strictRead:YES strictWrite:YES];
           MobileClient *serviceTwo = [[MobileClient alloc] initWithProtocol:protocol2];
        FeedResponse *revFeedResp;
        if (self.searchFilterInst) {
           revFeedResp = [serviceTwo getReviewsFeed:0 start:startPoint pageCount:40 searchCriteria:self.searchFilterInst];
        }
        else
        {
            revFeedResp = [serviceTwo getReviewsFeed:0 start:startPoint pageCount:40 searchCriteria:nil];
        }
        
        
        
        if(revFeedResp.response.responseCode == ResponseCode_Success) {
            NSLog(@"revFeedResp.items %@",revFeedResp.items);
        
           // Review * review = [revFeedResp.items objectAtIndex:0];
            
            NSLog(@"aray Count %d",self.arr_ReviewData.count);
            
            for (Review * obj in revFeedResp.items) {
                
                ReviewDashBoardModal * reviewObj = [[ReviewDashBoardModal alloc]init];
                
              reviewObj.str_imageURL =[NSString stringWithFormat:@"http://%@",obj.sourceLargeIconPath];
                [self.arr_logoImages addObject:reviewObj];
                [self.arr_ReviewData addObject:obj];
                
            }
            
            //self.arr_ReviewData = revFeedResp.items;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
             [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            if (arr_ReviewData.count>0) {
                
                [self.tblVw_review reloadData];
            }
            
        });
        
    });
    

}

//[self performSegueWithIdentifier:@"filterVC" sender:self];
#pragma mark Button Method
-(void)readMoreBtnClicked: (id) sender
{
    objFullViewController.reviewObj= [self.arr_ReviewData objectAtIndex: [sender tag]-1];
    ReviewDashBoardModal * reviewModal = [self.arr_logoImages objectAtIndex:[sender tag]];
    
    objFullViewController.imgVw_logoIcon.image =reviewModal.logoIcon;
    //  objFullViewController.imgVw_logoIcon
    [self.navigationController pushViewController:objFullViewController animated:YES];
}
-(void)replyBtnClicked: (id) sender
{
    Review * reviewObj = [self.arr_ReviewData objectAtIndex:[sender tag]-1];
    
    respondObj.str_reviewID = (NSString *)reviewObj.id;
    NSLog(@"%@",reviewObj.reviewerId);
    respondObj.isForwarded =NO;
    respondObj.reviewObj = reviewObj;
    
    [self.navigationController pushViewController:respondObj animated:YES];
}
-(void)forwardBtnClicked: (id) sender
{
    Review * reviewObj = [self.arr_ReviewData objectAtIndex:[sender tag]-1];
    
    respondObj.str_reviewID = (NSString *)reviewObj.id;
    NSLog(@"%@",reviewObj.reviewerId);
    respondObj.isForwarded =YES;
    respondObj.reviewObj = reviewObj;
    
    [self.navigationController pushViewController:respondObj animated:YES];
}
- (IBAction)btn_arrow:(id)sender {
/*    NSIndexPath *indexPath = [tbl_View indexPathForCell:(reviewsTableViewCell *)
                              [[[sender superview] superview] superview]];
    NSLog(@"The row id is %d",  indexPath.row);
    
    Review * reviewObj = [self.arr_ReviewData objectAtIndex:[sender tag]];
    
    NSMutableArray *arrResponse = [[NSMutableArray alloc] init];
    
    [arrResponse addObject:@"Full View"];
    NSLog(@"array = %@",reviewObj.allowedActions);
    
    for (int respIndx = 0; respIndx < reviewObj.allowedActions.count; respIndx++)
    {
        
        NSString *strResponse = [reviewObj.allowedActions objectAtIndex:respIndx];
        NSString *strTitles = [strResponse substringWithRange:NSMakeRange(16, [strResponse length]-16)];
        strTitles = [self sentenceCapitalizedString:strTitles];
        [arrResponse addObject:strTitles];
        
    }
    
    NSLog(@"titles = %@",arrResponse);
    
    
    
    
    
    if (!actionSheetReview) {
        actionSheetReview = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        
        for (NSString *title in arrResponse) {
            [actionSheetReview addButtonWithTitle:title];
        }
        [actionSheetReview addButtonWithTitle:@"Cancel"];
        actionSheetReview.cancelButtonIndex = [arrResponse count];
    }
    
    actionSheetReview.tag = [sender tag];
    
    [actionSheetReview showInView:self.view];
    
    actionSheetReview = nil;
    */
    
    
        NSIndexPath *indexPath = [tbl_View indexPathForCell:(reviewsTableViewCell *)
                                  [[[sender superview] superview] superview]];
        NSLog(@"The row id is %d",  indexPath.row);
        
        Review * reviewObj = [self.arr_ReviewData objectAtIndex:[sender tag]];
        
    
        
        NSLog(@"array = %@",reviewObj.allowedActions);
        NSString *str = @"forward";
        NSMutableArray *arrResponse = [dictResponse valueForKey:[NSString stringWithFormat:@"%i",[sender tag]]];
        NSPredicate *pred =[NSPredicate predicateWithFormat:@"SELF beginsWith[cd] %@",str];
        NSArray *arr_finalResponse =[arrResponse filteredArrayUsingPredicate:pred];
        NSLog(@"%@",arr_finalResponse);
        
    
        
        if (!actionSheetReview) {
            actionSheetReview = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
            [actionSheetReview addButtonWithTitle:@"Full View"];
            
            for (NSString *title in arrResponse) {
                [actionSheetReview addButtonWithTitle:title];
            }
            [actionSheetReview addButtonWithTitle:@"Cancel"];
            actionSheetReview.cancelButtonIndex = [arrResponse count];
        }
        
        actionSheetReview.tag = [sender tag];
         actionSheetReview.actionSheetStyle = UIActionSheetStyleDefault;
        [actionSheetReview showInView:self.view];
        
        actionSheetReview = nil;
        
   
    
}

- (NSString *)sentenceCapitalizedString :(NSString *)str {
    if (![str length]) {
        return [NSString string];
    }
    NSString *uppercase = [[str substringToIndex:1] uppercaseString];
    NSString *lowercase = [[str substringFromIndex:1] lowercaseString];
    return [uppercase stringByAppendingString:lowercase];
}


#pragma mark actionsheet delegates

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Reply"])
    {
        
        Review * reviewObj = [self.arr_ReviewData objectAtIndex:actionSheet.tag-1];
        
        respondObj.str_reviewID = (NSString *)reviewObj.id;
        NSLog(@"%@",reviewObj.reviewerId);
        respondObj.isForwarded =NO;
        respondObj.reviewObj = reviewObj;
       
           [self.navigationController pushViewController:respondObj animated:YES];
        
    }
    if([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Forward"])
    {
        
        Review * reviewObj = [self.arr_ReviewData objectAtIndex:actionSheet.tag-1];
         NSLog(@"%@",reviewObj.reviewerId);
        respondObj.str_reviewID = (NSString *)reviewObj.id;
        respondObj.isForwarded =TRUE;
         respondObj.reviewObj = reviewObj;
        [self.navigationController pushViewController:respondObj animated:YES];
        
    }
    if([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Publish"])
    {
        Review * reviewObj = [self.arr_ReviewData objectAtIndex:actionSheet.tag-1];
        
        [self publishReview:(NSString *)reviewObj.id];
    }
    if([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Unpublish"])
    {
        Review * reviewObj = [self.arr_ReviewData objectAtIndex:actionSheet.tag-1];
        [self unPublishReview :reviewObj.id];
    }
    if([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Delete"])
    {
         Review * reviewObj = [self.arr_ReviewData objectAtIndex:actionSheet.tag-1];
      [self deleteReview:reviewObj.id];
    }
}

//- (RatingResponse *) publishRating: (NSString *) ratingID isUnpublish: (BOOL) isUnpublish;
//- (RatingResponse *) deleteRating: (NSString *) ratingID;
#pragma mark ActionSheet Delegates Method
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Full View"])
    {
        objFullViewController.reviewObj= [self.arr_ReviewData objectAtIndex: actionSheet.tag-1];
        ReviewDashBoardModal * reviewModal = [self.arr_logoImages objectAtIndex:actionSheet.tag];
        
        objFullViewController.imgVw_logoIcon.image =reviewModal.logoIcon;
      //  objFullViewController.imgVw_logoIcon
        [self.navigationController pushViewController:objFullViewController animated:YES];
    }
    
}
-(void)deleteReview:(NSString *)reviewId
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_async(queue, ^{
        
        
        THMACHttpClient *httpTwoClient = [[THMACHttpClient alloc] initWithURL:[NSURL URLWithString:kServiceURL] userId:[AppDelegate sharedDelegate].userObj.email secret:[AppDelegate sharedDelegate].userObj.userKey];
        
        TBinaryProtocol *protocol2 = [[TBinaryProtocol alloc] initWithTransport:httpTwoClient strictRead:YES strictWrite:YES];
        MobileClient *serviceTwo = [[MobileClient alloc] initWithProtocol:protocol2];
        RatingResponse * response = [serviceTwo deleteRating:reviewId];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
             [MBProgressHUD hideHUDForView:self.view animated:YES];
            if (response.response.responseCode==ResponseCode_Success) {
                
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"This Review has been deleted successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                alert = nil;
            }
            else
            {
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Failed" message:response.response.error.message  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                alert = nil;
                
            }
        });
        
    });

    
}
-(void)publishReview:(NSString *)reviewId
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_async(queue, ^{
        
        
        THMACHttpClient *httpTwoClient = [[THMACHttpClient alloc] initWithURL:[NSURL URLWithString:kServiceURL] userId:[AppDelegate sharedDelegate].userObj.email secret:[AppDelegate sharedDelegate].userObj.userKey];
        
        TBinaryProtocol *protocol2 = [[TBinaryProtocol alloc] initWithTransport:httpTwoClient strictRead:YES strictWrite:YES];
        MobileClient *serviceTwo = [[MobileClient alloc] initWithProtocol:protocol2];
        RatingResponse * response = [serviceTwo publishRating:reviewId isUnpublish:NO];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
             [MBProgressHUD hideHUDForView:self.view animated:YES];
            if (response.response.responseCode==ResponseCode_Success) {
                
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"This Review has been published successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                alert = nil;
            }
            else
            {
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Failed" message:response.response.error.message  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                alert = nil;
                
            }
        });
        
    });

    
}
-(void)unPublishReview: (NSString *)reviewId
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_async(queue, ^{
        
        
        THMACHttpClient *httpTwoClient = [[THMACHttpClient alloc] initWithURL:[NSURL URLWithString:kServiceURL] userId:[AppDelegate sharedDelegate].userObj.email secret:[AppDelegate sharedDelegate].userObj.userKey];
        
        TBinaryProtocol *protocol2 = [[TBinaryProtocol alloc] initWithTransport:httpTwoClient strictRead:YES strictWrite:YES];
        MobileClient *serviceTwo = [[MobileClient alloc] initWithProtocol:protocol2];
        RatingResponse * response = [serviceTwo publishRating:reviewId isUnpublish:YES];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
             [MBProgressHUD hideHUDForView:self.view animated:YES];
            if (response.response.responseCode==ResponseCode_Success) {
                
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"This Review has been unpublished successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                alert = nil;
            }
                else
                {
                    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Failed" message:response.response.error.message  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                    alert = nil;
                    
                }
        });
        
    });
  
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self getReviewsData:startIndex];
    }
    
    
}

#pragma mark - Table cell image support

// -------------------------------------------------------------------------------
//	startIconDownload:forIndexPath:
// -------------------------------------------------------------------------------
- (void)startIconDownload:(ReviewDashBoardModal *)appRecord forIndexPath:(NSIndexPath *)indexPath
{
    IconDownloader *iconDownloader = [self.imageDownloadsInProgress objectForKey:indexPath];
    if (iconDownloader == nil)
    {
        iconDownloader = [[IconDownloader alloc] init];
        iconDownloader.appRecord = appRecord;
        [iconDownloader setCompletionHandler:^{
            
            reviewsTableViewCell *cell = (reviewsTableViewCell *)[self.tblVw_review cellForRowAtIndexPath:indexPath];
            
            // Display the newly loaded image
            cell.img_logoIcon.image = appRecord.logoIcon;
            
            // Remove the IconDownloader from the in progress list.
            // This will result in it being deallocated.
            [self.imageDownloadsInProgress removeObjectForKey:indexPath];
            
        }];
        [self.imageDownloadsInProgress setObject:iconDownloader forKey:indexPath];
        [iconDownloader startDownload];
    }
}

// -------------------------------------------------------------------------------
//	loadImagesForOnscreenRows
//  This method is used in case the user scrolled into a set of cells that don't
//  have their app icons yet.
// -------------------------------------------------------------------------------
- (void)loadImagesForOnscreenRows
{
    if ([self.arr_logoImages count] > 0)
    {
        NSArray *visiblePaths = [self.tblVw_review indexPathsForVisibleRows];
        for (NSIndexPath *indexPath in visiblePaths)
        {
            ReviewDashBoardModal *appRecord = [self.arr_logoImages objectAtIndex:indexPath.row];
            
            if ([appRecord isKindOfClass:[ReviewDashBoardModal class]]) {
                if (!appRecord.logoIcon)
                    // Avoid the app icon download if the app already has an icon
                {
                    [self startIconDownload:appRecord forIndexPath:indexPath];
                }
            }
          
        }
    }
}


#pragma mark - UIScrollViewDelegate

// -------------------------------------------------------------------------------
//	scrollViewDidEndDragging:willDecelerate:
//  Load images for all onscreen rows when scrolling is finished.
// -------------------------------------------------------------------------------
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
	{
        [self loadImagesForOnscreenRows];
    }
}

// -------------------------------------------------------------------------------
//	scrollViewDidEndDecelerating:
// -------------------------------------------------------------------------------
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self loadImagesForOnscreenRows];
}



@end
