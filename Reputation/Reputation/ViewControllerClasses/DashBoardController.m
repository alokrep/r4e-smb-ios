//
//  DashBoardController.m
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "DashBoardController.h"
#import "CustomNavigation.h"
#import "Mobile.h"

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
    
    [self.arr_reviewsData addObjectsFromArray:[NSArray arrayWithObjects:dict,dict1,dict2,dict3, nil]];
    
    NSDictionary * dictsocial = [NSDictionary dictionaryWithObjectsAndKeys:@"Google+",@"Title",@"39",@"Posts",@"39",@"Likes",@"39",@"Shares", nil];
   NSDictionary * dictsocial1 = [NSDictionary dictionaryWithObjectsAndKeys:@"FaceBook",@"Title",@"114",@"Posts",@"114",@"Likes",@"114",@"Shares", nil];
    NSDictionary * dictsocial2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Twitter",@"Title",@"47",@"Posts",@"47",@"Likes",@"47",@"Shares", nil];
    [self.arr_SocialData addObjectsFromArray:[NSArray arrayWithObjects:dictsocial,dictsocial1,dictsocial2, nil]];
    
}
-(void)tempMethod
{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(queue, ^{
        
        
        NSURL *loginEndpointURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@login",kServiceURL]];
        THMACHttpClient *httpClient = [[THMACHttpClient alloc] initWithURL:loginEndpointURL userId:@"user.email" secret:@"reputation"];
        TBinaryProtocol *protocol = [[TBinaryProtocol alloc] initWithTransport:httpClient strictRead:YES strictWrite:YES];
        MobileAuthClient *service = [[MobileAuthClient alloc] initWithProtocol:protocol];
        Response *resp = [service login:@"temp" password:@"test"].response;
        NSLog(@"resp%@",resp);
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
         
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
        cell.lbl_reviewsNumber.text= [[self.arr_reviewsData objectAtIndex:indexPath.row] valueForKey:@"Reviews"];
        cell.lbl_points.text= [[self.arr_reviewsData objectAtIndex:indexPath.row] valueForKey:@"Points"];
        
        
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
