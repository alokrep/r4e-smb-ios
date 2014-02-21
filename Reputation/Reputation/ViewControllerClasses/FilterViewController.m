//
//  filterTableViewController.m
//  Reputation
//
//  Created by arun kumar on 2/4/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "FilterViewController.h"
#import "CustomNavigation.h"

static NSString * FILTER_SENTIMENT_NEGATIVE = @"sentiment_negtive";
static NSString * FILTER_SENTIMENT_NEUTRAL = @"sentiment_neutral";
static NSString * FILTER_SENTIMENT_POSITIVE = @"sentiment_positive";


//extern  NSString * const  FILTER_DT_LAST_7_DAYS;
//extern  NSString * const  FILTER_DT_LAST_30_DAYS;
//extern  NSString * const  FILTER_DT_LAST_60_DAYS ;
//extern  NSString * const  FILTER_DT_LAST_90_DAYS ;
//extern  NSString * const  FILTER_DT_LAST_120_DAYS ;
//extern  NSString * const  FILTER_DT_THIS_MONTH ;
//extern  NSString * const  FILTER_DT_LAST_1_MONTH ;
//extern  NSString * const  FILTER_DT_LAST_2_MONTHS ;
//extern  NSString * const  FILTER_DT_LAST_3_MONTHS ;
//extern  NSString * const  FILTER_DT_LAST_6_MONTHS;
//extern  NSString * const  FILTER_DT_LAST_1_YEAR ;
//extern  NSString * const  FILTER_DT_LAST_2_YEARS ;
//extern  NSString * const  FILTER_DT_LAST_3_YEARS ;
//extern  NSString * const  FILTER_DT_ALL_TIME ;
@interface FilterViewController ()

@end

@implementation FilterViewController

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
    
    
    userConfigObj=[self loadUserObjectWithKey:kUserConfig];
    
    
    

    
    self.arr_selectedSites = [[NSMutableArray alloc] init];
    dict_check = [[NSMutableDictionary alloc]init];
    
    arr_Sites = [[NSMutableArray alloc] init];
    self.view.backgroundColor = [UIColor colorWithRed:235.0f/255.0f green:235.0f/255.0f blue:242.0f/255.0f alpha:1.0];
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    navigationObj.lbl_title.text = @"Filter";
    navigationObj.backBtn.hidden = NO;
    
    
    pickerArray_component0 = userConfigObj.dateRanges.facetOptions;
    
    
    
    for (FacetOption * obj in userConfigObj.reviewSources.facetOptions) {
        
        [arr_Sites addObject:obj];
    }
    [self.tblView_sites reloadData];
    

}
-(void) popTOView
{
       //[]
    
       //[navigationObj popViewControllerAnimated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    navigationObj.dashBtn.hidden = YES;
    navigationObj.backBtn.hidden = NO;
    
    self.toolBarTime.hidden = YES;
    self.pickerViewTime.hidden = YES;
    self.tblView_sites.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated
{
    NSMutableArray * arrsentiment = [NSMutableArray array];
    
    if (self.switchNegative.state ==1) {
        [arrsentiment addObject:FILTER_SENTIMENT_NEGATIVE];
    }
    if (self.switchNeutral.state ==1) {
        [arrsentiment addObject:FILTER_SENTIMENT_NEUTRAL];
    }
    if (self.switchPositive.state ==1) {
        [arrsentiment addObject:FILTER_SENTIMENT_POSITIVE];
    }
    NSMutableArray * arrsourceFilter =[NSMutableArray array];
    
    for (FacetOption * obj in self.arr_selectedSites) {
        
        [arrsourceFilter addObject:obj.value];
    }
    
    int selected= [self.pickerViewTime selectedRowInComponent:0];
    FacetOption * face=[pickerArray_component0 objectAtIndex:selected];
    
    SearchFilter * search = [[SearchFilter alloc]initWithDateRangeFilterId:face.value sentimentFilters:arrsentiment sourceSiteFilter:arrsourceFilter startDate:nil endDate:nil];
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    
    
    ReviewsController * reviewVCObj =(ReviewsController *)[navigationObj.viewControllers objectAtIndex:0];
    
    reviewVCObj.searchFilterInst = search;
    
    

    
}
-(UserConfig *)loadUserObjectWithKey:(NSString*)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [prefs objectForKey:kUserConfig ];
    UserConfig *obj = (UserConfig *)[NSKeyedUnarchiver unarchiveObjectWithData:myEncodedObject];
    return obj;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    
        UILabel *lblTitle = [[UILabel alloc] init];
        lblTitle.frame = CGRectMake(20, 100,180, 70);
    lblTitle.textAlignment = NSTextAlignmentCenter;
    FacetOption * face=[pickerArray_component0 objectAtIndex:row];
        lblTitle.text = face.label;
        return lblTitle;
   

    
    
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        //cellFilter.detailTextLabel.text = str_game;
    }
    
  //  cellFilter.detailTextLabel.text = [];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component;
{
    return 40;
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component;
{
    return 180;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component==0)
    {
        //str_game=[pickerArray_component0 objectAtIndex:row];
       // [cellFilter reloadInputViews ];
    }
   
}


/* For me the number of items in the UIPickerView is known on compile time. So here I just return 3 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return pickerArray_component0.count;

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
        return arr_Sites.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleIdentifier = @"FilterCustom";
    
    
   
    FilterSitesCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleIdentifier];
    if(cell == nil)
    {
        cell = (FilterSitesCell *)[[FilterSitesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleIdentifier];
    }
   cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
      //
//    UITableViewCell *cell = [super tableView:tableView
//                       cellForRowAtIndexPath:indexPath];
    
  
    FacetOption * faceObj = [arr_Sites objectAtIndex:indexPath.row];
    [cell.btn_check addTarget:self action:@selector(checkBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.btn_check.tag = indexPath.row;
    
    cell.lbl_title.text = faceObj.label;
    
    NSString * strTemp =[NSString stringWithFormat:@"%d",indexPath.row];
    if ([[dict_check objectForKey:strTemp] isEqualToString:@"Yes"]) {
      [cell.btn_check setImage:[UIImage imageNamed:@"checkBtn.png"] forState:UIControlStateNormal];
        
    }
    else
    {
       [cell.btn_check setImage:[UIImage imageNamed:@"uncheckBtn.png"] forState:UIControlStateNormal];
        
    }
    
    
    
    return cell;

}


-(void)checkBtnClicked:(id) sender
{
    
    
    NSString * strTemp =[NSString stringWithFormat:@"%d",[sender tag]];
   
        if ([[dict_check objectForKey:strTemp] isEqualToString:@"Yes"]) {
            [dict_check setObject:@"No" forKey:[NSString stringWithFormat:@"%d",[sender tag]]];
            UIButton * btn = (UIButton *)sender;
            [btn setImage:[UIImage imageNamed:@"uncheckBtn.png"] forState:UIControlStateNormal];
            
            FacetOption * faceObj;
            
            
            for (FacetOption * opt in self.arr_selectedSites) {
                
                if ([opt isEqual:[arr_Sites objectAtIndex:[sender tag]]]) {
                    
                    faceObj = opt;
                }
            }
            if (faceObj) {
                 [self.arr_selectedSites removeObject:faceObj];
            }
           
            
        }
    else
    {
        [dict_check setObject:@"Yes" forKey:[NSString stringWithFormat:@"%d",[sender tag]]];
        UIButton * btn = (UIButton *)sender;
        [btn setImage:[UIImage imageNamed:@"checkBtn.png"] forState:UIControlStateNormal];
        
        [self.arr_selectedSites addObject:[arr_Sites objectAtIndex:[sender tag]]];
    }
        
  
    
    [self.tblView_sites reloadData];
    
    
    
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

- (IBAction)segmentValueChanged:(id)sender {
    
  
    
}

- (IBAction)sitesArrowBtnClicked:(id)sender {
    self.tblView_sites.hidden = NO;
    self.toolBarTime.hidden = NO;
    
    CGRect frametemp = self.tblView_sites.frame;
    
    
    frametemp.origin.y = self.view.frame.size.height-self.tblView_sites.frame.size.height-40;
    self.tblView_sites.frame= frametemp;
    
    CGRect frame = self.toolBarTime.frame;
    
    frame.origin.y = self.tblView_sites.frame.origin.y-44;
    
    self.toolBarTime.frame=frame;
}

- (IBAction)timeArrowBtnClicked:(id)sender {
    
    
    //actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Done" destructiveButtonTitle:nil otherButtonTitles:@"",@"",@"",nil];
    
    CGRect frametemp = self.pickerViewTime.frame;
    
    
    frametemp.origin.y = self.view.frame.size.height-self.pickerViewTime.frame.size.height-20;
    self.pickerViewTime.frame= frametemp;
    
    CGRect frame = self.toolBarTime.frame;
    
    frame.origin.y = self.pickerViewTime.frame.origin.y-44;
    
    self.toolBarTime.frame=frame;
    
    self.toolBarTime.hidden = NO;
    self.pickerViewTime.hidden = NO;
    self.pickerViewTime.showsSelectionIndicator=YES;
    self.pickerViewTime.backgroundColor = [UIColor whiteColor];
    
    //[self.view addSubview:positionPicker];
    
    //[actionSheet showInView:[AppDelegate sharedDelegate].window];
    //actionSheet = nil;
    //[actionSheet setBounds:CGRectMake(0,0, 320, 480)];
}
- (IBAction)doneBtnClicked:(id)sender {
    
    if (self.tblView_sites.hidden) {
        int selected= [self.pickerViewTime selectedRowInComponent:0];
        FacetOption * face=[pickerArray_component0 objectAtIndex:selected];
        lbl_TimeValue.text = face.label;
    }
    else
    {
        
    }
    
  
    self.toolBarTime.hidden = YES;
    self.pickerViewTime.hidden = YES;
    self.tblView_sites.hidden = YES;
    
}
@end
