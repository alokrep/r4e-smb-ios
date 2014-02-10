//
//  DashBoardController.m
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "DashBoardController.h"
#import "CustomNavigation.h"
#import "THMACHttpClient.h"
#import "TBinaryProtocol.h"
#import "Mobile.h"
#import "MobileAuth.h"

@interface DashBoardController ()

@end

@implementation DashBoardController
@synthesize arr_reviewsData;
@synthesize arr_SocialData;

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
    navigationObj.lbl_title.text = @"Dashboard";
    
    self.view.backgroundColor = [UIColor colorWithRed:234.0f/255.0f green:234.0f/255.0f blue:234.0f/255.0f alpha:1.0];
    self.tblVw_review.layer.borderColor = [[UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0] CGColor];
    self.tblVwSocial.layer.borderColor = [[UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0] CGColor];
    self.tblVwSocial.layer.borderWidth = 1.0f;
    self.tblVw_review.layer.borderWidth = 1.0f;
    self.arr_SocialData = [[NSMutableArray alloc]init];
    self.arr_reviewsData = [[NSMutableArray alloc]init];
    
    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:@"Google Places",@"Title",@"54 Reviews",@"Reviews",@"4.2",@"Points",@"90",@"RectX", nil];
    NSDictionary * dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"Yelp",@"Title",@"47 Reviews",@"Reviews",@"4.0",@"Points",@"110",@"RectX", nil];
    NSDictionary * dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Yahoo!",@"Title",@"11 Reviews",@"Reviews",@"3.9",@"Points",@"60",@"RectX", nil];
    NSDictionary * dict3 = [NSDictionary dictionaryWithObjectsAndKeys:@"Yellow Pages",@"Title",@"15 Reviews",@"Reviews",@"4.2",@"Points",@"80",@"RectX", nil];
    
  //  [self.arr_reviewsData addObjectsFromArray:[NSArray arrayWithObjects:dict,dict1,dict2,dict3, nil]];
    
    NSDictionary * dictsocial = [NSDictionary dictionaryWithObjectsAndKeys:@"Google+",@"Title",@"39",@"Posts",@"39",@"Likes",@"39",@"Shares", nil];
   NSDictionary * dictsocial1 = [NSDictionary dictionaryWithObjectsAndKeys:@"FaceBook",@"Title",@"114",@"Posts",@"114",@"Likes",@"114",@"Shares", nil];
    NSDictionary * dictsocial2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Twitter",@"Title",@"47",@"Posts",@"47",@"Likes",@"47",@"Shares", nil];
    [self.arr_SocialData addObjectsFromArray:[NSArray arrayWithObjects:dictsocial,dictsocial1,dictsocial2, nil]];
<<<<<<< HEAD
    [self callDashBoardAPI];
=======
    [self tempMethod];
>>>>>>> 20a6015af56ccd3fba7b194b03275498db86f698
    
}
/*
-(void)alokMethod
{
    THMACHttpClient *httpTwoClient = [[THMACHttpClient alloc] initWithURL:[NSURL URLWithString:@"http://10.20.23.104:45003/"] userId:@"alok.damireddy+1@reputation.com" secret:@"-364253313"];
    
    TBinaryProtocol *protocol2 = [[TBinaryProtocol alloc] initWithTransport:httpTwoClient strictRead:YES strictWrite:YES];
    MobileClient *serviceTwo = [[MobileClient alloc] initWithProtocol:protocol2];
    @try {
 
//         FeedResponse *revFeedResp = [serviceTwo getReviewsFeed:0 start:0 pageCount:40 searchCriteria:nil];
//         if(revFeedResp.response.responseCode == ResponseCode_Success) {
//         NSLog(@"reviewFeedItens%@",revFeedResp.items);
//         }
 
        SummaryResponse *summResp = [serviceTwo getSummary];
        if(summResp.response.responseCode == ResponseCode_Success) {
            NSLog(@"reviewFeedItens%@",summResp.aggregates);
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        // Added to show finally works as well
    }
}
 */
-(void)tempMethod
{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(queue, ^{
    
    
        NSURL *loginEndpointURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@login",kServiceURL]];
        THMACHttpClient *httpClient = [[THMACHttpClient alloc] initWithURL:loginEndpointURL userId:@"alok.damireddy+1@reputation.com" secret:@"reputation"];
        TBinaryProtocol *protocol = [[TBinaryProtocol alloc] initWithTransport:httpClient strictRead:YES strictWrite:YES];
        MobileAuthClient *service = [[MobileAuthClient alloc] initWithProtocol:protocol];
        LoginResponse *resp = [service login:@"alok.damireddy+1@reputation.com" password:@"51190bad0"];

        NSLog(@"resp%@",resp);
        if(resp.response.responseCode == ResponseCode_Success) {
            NSLog(@"userKey%@",resp.userDetails.userKey);
            
//            THMACHttpClient *httpTwoClient = [[THMACHttpClient alloc] initWithURL:[NSURL URLWithString:kServiceURL] userId:@"alok.damireddy+1@reputation.com" secret:@"-364253313"];
            THMACHttpClient *httpTwoClient = [[THMACHttpClient alloc] initWithURL:[NSURL URLWithString:kServiceURL] userId:resp.userDetails.email secret:resp.userDetails.userKey];
            
            TBinaryProtocol *protocol2 = [[TBinaryProtocol alloc] initWithTransport:httpTwoClient strictRead:YES strictWrite:YES];
            MobileClient *serviceTwo = [[MobileClient alloc] initWithProtocol:protocol2];
        
            @try {
                /*
                FeedResponse *revFeedResp = [serviceTwo getReviewsFeed:0 start:0 pageCount:40 searchCriteria:nil];
                if(revFeedResp.response.responseCode == ResponseCode_Success) {
                    NSLog(@"revFeedResp.items %@",revFeedResp.items);
                }
                */
                SummaryResponse *summResp = [serviceTwo getSummary];
                if(summResp.response.responseCode == ResponseCode_Success) {
                    NSLog(@"summResp.aggregates %@",summResp.aggregates);
                    NSMutableArray *rows = [NSMutableArray array];
                    NSNumberFormatter *avgRatFmt = [[NSNumberFormatter alloc] init];
                    avgRatFmt.numberStyle = NSNumberFormatterDecimalStyle;
                    //[avgRatFmt setFormat:@"0.#"];
                    for(SummaryCell *agg in summResp.aggregates) {
//                        if ([aggG isKindOfClass:[SummaryCell class]]) {
                            //SummaryCell *agg = (SummaryCell)aggG;
                            if([agg.name isEqualToString:MobileConstants.SUMMARY_AVGRATING_SOURCE]) {
                                //This for the Dashboard tab
                                for(SummaryValue *summVal in agg.values) {
                                    //Review Sites
                                    
                                    //Rating out of 5
                                    //The vertical bar should be offset by a percent amount
                                    // on the graphic
                                    double avgRating = summVal.value;
                                    NSNumber *avgRatingNum = [NSNumber numberWithDouble:avgRating];
                                    
                                    //Total no of Reviews
                                    NSString * reviewCount = [summVal.addlProps objectForKey:MobileConstants.SUMMARY_NOREVIEWS_SOURCE];
                                    
                                    //Source URL
                                    NSString * sourceLogoUrl = [summVal.addlProps objectForKey:MobileConstants.SUMMARY_NOREVIEWS_SOURCELOGO];
                                    
                                    //Source Name
                                    NSString * sourceName = [summVal.addlProps objectForKey:MobileConstants.SUMMARY_NOREVIEWS_SOURCENAME];
                                    
                                    NSDictionary * row = [NSDictionary dictionaryWithObjectsAndKeys:[summVal name],@"Title",reviewCount,@"Reviews",[avgRatFmt stringFromNumber:avgRatingNum],@"Points",@"90",@"RectX", nil];
                                    
                                    [rows addObject:row];
                                }
                            }
                        if([agg.name isEqualToString:MobileConstants.SUMMARY_OVERALL_SCORE]) {
                            //This for the score tab
                            for(SummaryValue *summVal in agg.values) {
                                //overall score
                                double ovScore = summVal.value * 1000;
                                
                                //weighted average
                                NSString * weightedAvg = [summVal.addlProps objectForKey:MobileConstants.SUMMARY_OVERALL_SCORE_WEIGHTEDRATING];
                                
                                //Volume
                                NSString * volume = [summVal.addlProps objectForKey:MobileConstants.SUMMARY_OVERALL_SCORE_VOLUME];
                                
                                //Recentness
                                NSString * recentness = [summVal.addlProps objectForKey:MobileConstants.SUMMARY_OVERALL_SCORE_TIME];
                                
                                //Length
                                NSString * length = [summVal.addlProps objectForKey:MobileConstants.SUMMARY_OVERALL_SCORE_LENGTH];
                                
                                //Spread
                                NSString * spread = [summVal.addlProps objectForKey:MobileConstants.SUMMARY_OVERALL_SCORE_SPREAD];
                                
                                //Visibility
                                NSString * visibility = [summVal.addlProps objectForKey:MobileConstants.SUMMARY_OVERALL_SCORE_VISIBILITY];
                                
                                
                            }
                        }
//                        }
                    }
                    [self.arr_reviewsData removeAllObjects];
                    [self.arr_reviewsData addObjectsFromArray:rows];
                }
            }
            @catch (NSException * e) {
                NSLog(@"Exception: %@", e);
            }
            @finally {
                // Added to show finally works as well
            }

        }
    
    
        //NSLog(@"resp%@",resp);
        
       
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSDate *now = [NSDate date];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"YYYY-MM-dd"];
            [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT-12"]];
            NSString *temp = [dateFormatter stringFromDate:now];
            
            [NSURL URLWithString:kServiceURL];
        });

    });
}
-(void)callDashBoardAPI
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(queue, ^{
        
        THMACHttpClient *httpTwoClient = [[THMACHttpClient alloc] initWithURL:[NSURL URLWithString:kServiceURL] userId:[AppDelegate sharedDelegate].userObj.email secret:[AppDelegate sharedDelegate].userObj.userKey];
        
        TBinaryProtocol *protocol2 = [[TBinaryProtocol alloc] initWithTransport:httpTwoClient strictRead:YES strictWrite:YES];
        
        SummaryResponse *summResp;
        @try {
            MobileClient *serviceTwo = [[MobileClient alloc] initWithProtocol:protocol2];
            summResp = [serviceTwo getSummary];
        }
        @catch (NSException *exception) {
            
            
            NSLog(@"exception %@",exception);
        }
        @finally {
            
             if(summResp.response.responseCode == ResponseCode_Success) {
                 
                 
             }
            
        }
        
        if(summResp.response.responseCode == ResponseCode_Success) {
            
            for(SummaryCell *agg in summResp.aggregates)
            {
                
            NSLog(@" value array %@",agg.values);
            
                if([agg.name isEqualToString:MobileConstants.SUMMARY_AVGRATING_SOURCE]) {
                    //This for the Dashboard tab
                    for(SummaryValue *summVal in agg.values) {
                        
                        
                        double avgRating = summVal.value;
                        NSNumber *avgRatingNum = [NSNumber numberWithDouble:avgRating];
                        
                        NSString * sliderValue = [NSString stringWithFormat:@"%f",summVal.value];
                        
                        
                        NSString * reviewCount = [summVal.addlProps objectForKey:MobileConstants.SUMMARY_NOREVIEWS_SOURCE];
                        
                        //Source URL
                        NSString * sourceLogoUrl = [summVal.addlProps objectForKey:MobileConstants.SUMMARY_NOREVIEWS_SOURCELOGO];
                        
                        //Source Name
                        NSString * sourceName = [summVal.addlProps objectForKey:MobileConstants.SUMMARY_NOREVIEWS_SOURCENAME];
                        
                         NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:sourceName,@"Title",reviewCount,@"Reviews",sliderValue,@"Points",sourceLogoUrl,@"image_URL",nil];
                        
                        [self.arr_reviewsData addObject:dict];
                        
                
                    }
            }
            
        }
        
        NSLog(@"DashBoard %@",self.arr_reviewsData);
        
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
           
            [self.tblVw_review reloadData];
           
        });
        
    });
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
# pragma mark  TableView Delegates Method
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:self.tblVw_review]) {
        return self.arr_reviewsData.count;
    }
    else
    {
        return self.arr_SocialData.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.tblVw_review]) {
        
        
    
    static NSString *simpleIdentifier = @"SimpleIdentifier";
    
    
    ReviewCustomCell *cell = (ReviewCustomCell *)[tableView dequeueReusableCellWithIdentifier:simpleIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ReviewCustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
        cell.lbl_titleName.text= [[self.arr_reviewsData objectAtIndex:indexPath.row] valueForKey:@"Title"];
        
        NSString * str_temp = [NSString stringWithFormat:@"%@",[[self.arr_reviewsData objectAtIndex:indexPath.row] valueForKey:@"Points"]];
        NSString * str;
        
        if (str_temp.length>2) {
            str = [str_temp substringToIndex:3];
        }
        else
            str = str_temp ;
        
        cell.slider_point.value = [str floatValue];
        [cell.slider_point setThumbImage:[UIImage imageNamed:@"slider_pt.png"] forState:UIControlStateNormal];
        [cell.slider_point setThumbImage:[UIImage imageNamed:@"slider_pt.png"] forState:UIControlStateSelected];
        cell.lbl_points.text= str ;

        
        
        NSNumberFormatter* noFormObj = [[NSNumberFormatter alloc] init];
        noFormObj.positiveFormat = @"0#";
        noFormObj.roundingMode = NSNumberFormatterRoundFloor;
        //NSString* trimmedValue =[NSString stringWithFormat:@"%@k",[nf stringFromNumber:[[self.arr_reviewsData objectAtIndex:indexPath.row] valueForKey:@"Reviews"]]]];
        NSNumber  *reviwe_temp =[NSNumber numberWithInt:[[[self.arr_reviewsData objectAtIndex:indexPath.row] valueForKey:@"Reviews"] intValue]];
        //[[[self.arr_reviewsData objectAtIndex:indexPath.row] valueForKey:@"Reviews"] intValue];
        
        NSString * trimmedValue = [NSString stringWithFormat:@"%@",[noFormObj stringFromNumber:reviwe_temp]];
        
        NSLog(@"trimmedValue: %1@", trimmedValue);
        
        cell.lbl_reviewsNumber.text= [NSString stringWithFormat:@"%@ Reviews",trimmedValue];
        
        noFormObj = nil;
        
        
        
        switch (indexPath.row) {
            case 0:
                cell.imgVw_icon.image = [UIImage imageNamed:@"facebook_icon.png"];
                break;
            case 1:
                 cell.imgVw_icon.image = [UIImage imageNamed:@"yelp_icon.png"];
                break;
            case 2:
                 cell.imgVw_icon.image = [UIImage imageNamed:@"yahoo_icon.png"];
                break;
            case 3:
                 cell.imgVw_icon.image = [UIImage imageNamed:@"yello_pages_icon.png"];
                break;
                
            default:
                break;
        }
    return cell;
        
    }
    
    else if  ([tableView isEqual:self.tblVwSocial]) {
        static NSString *simpleTableIdentifier = @"TableIdentifier";
        
        
        
        SocialCustomCell *cell = (SocialCustomCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SocialCustomCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
         // NSDictionary * dictsocial2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Twitter",@"Title",@"47",@"Posts",@"47",@"Likes",@"47",@"Shares", nil];
        cell.lbl_title.text= [[self.arr_SocialData objectAtIndex:indexPath.row] valueForKey:@"Title"];
        cell.lbl_postValue.text= [[self.arr_SocialData objectAtIndex:indexPath.row] valueForKey:@"Posts"];
        cell.lbl_middleValue.text= [[self.arr_SocialData objectAtIndex:indexPath.row] valueForKey:@"Likes"];
        cell.lbl_shares.text= [[self.arr_SocialData objectAtIndex:indexPath.row] valueForKey:@"Shares"];
        switch (indexPath.row) {
            case 0:
                 cell.imgVw_icon.image = [UIImage imageNamed:@"google_plus_icon.png"];
                cell.lbl_postTitle.text= @"Posts";
                cell.lbl_middleTitle.text= @"+1s";
                cell.lbl_shareTitle.text= @"Shares";
                break;
            case 1:
                
                cell.imgVw_icon.image = [UIImage imageNamed:@"facebook_icon.png"];
                cell.lbl_postTitle.text= @"Posts";
                cell.lbl_middleTitle.text= @"Likes";
                cell.lbl_shareTitle.text= @"Shares";
                break;
            case 2:
                cell.imgVw_icon.image = [UIImage imageNamed:@"twitter_icon.png"];
                cell.lbl_postTitle.text= @"Tweets";
                cell.lbl_middleTitle.text= @"Followers";
                cell.lbl_shareTitle.text= @"Retweets";
                break;
                
            default:
                break;
        }
        
        
        
        return cell;
        
    }
    
    return nil;
}

@end
