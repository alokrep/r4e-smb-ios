//
//  filterTableViewController.m
//  Reputation
//
//  Created by arun kumar on 2/4/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "FilterViewController.h"
#import "CustomNavigation.h"

extern  NSString * const  FILTER_DT_LAST_7_DAYS;
extern  NSString * const  FILTER_DT_LAST_30_DAYS;
extern  NSString * const  FILTER_DT_LAST_60_DAYS ;
extern  NSString * const  FILTER_DT_LAST_90_DAYS ;
extern  NSString * const  FILTER_DT_LAST_120_DAYS ;
extern  NSString * const  FILTER_DT_THIS_MONTH ;
extern  NSString * const  FILTER_DT_LAST_1_MONTH ;
extern  NSString * const  FILTER_DT_LAST_2_MONTHS ;
extern  NSString * const  FILTER_DT_LAST_3_MONTHS ;
extern  NSString * const  FILTER_DT_LAST_6_MONTHS;
extern  NSString * const  FILTER_DT_LAST_1_YEAR ;
extern  NSString * const  FILTER_DT_LAST_2_YEARS ;
extern  NSString * const  FILTER_DT_LAST_3_YEARS ;
extern  NSString * const  FILTER_DT_ALL_TIME ;
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
    
    
    
    NSLog(@"%@",FILTER_DT_LAST_7_DAYS);


    
    timeArray = [[NSMutableArray alloc] init];
    arr_Sites = [[NSMutableArray alloc] init];
    reviewsArray = [[NSMutableArray alloc] init];
    self.view.backgroundColor = [UIColor colorWithRed:235.0f/255.0f green:235.0f/255.0f blue:242.0f/255.0f alpha:1.0];
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    navigationObj.lbl_title.text = @"Filter";
    navigationObj.backBtn.hidden = NO;
    [navigationObj.backBtn addTarget:self action:@selector(popTOView) forControlEvents:UIControlEventTouchUpInside];
    
    // Add some data for demo purposes.
    pickerArray_component0 = [[NSMutableArray alloc]initWithObjects:                           FILTER_DT_LAST_7_DAYS,FILTER_DT_LAST_30_DAYS,
                              FILTER_DT_LAST_60_DAYS,
                              FILTER_DT_LAST_90_DAYS,
                              FILTER_DT_LAST_120_DAYS,
                              FILTER_DT_THIS_MONTH,
                              FILTER_DT_LAST_1_MONTH,
                              FILTER_DT_LAST_2_MONTHS,
                              FILTER_DT_LAST_3_MONTHS,
                              FILTER_DT_LAST_6_MONTHS,
                              FILTER_DT_LAST_1_YEAR,
                              FILTER_DT_LAST_2_YEARS,
                              FILTER_DT_LAST_3_YEARS,
                              FILTER_DT_ALL_TIME, nil];
    
    
    SourcesList * sourceObj = userConfigObj.allSites;
    
    
    for (Source * obj in sourceObj.reviewSites) {
        
        [arr_Sites addObject:obj];
    }
    for (Source * obj in sourceObj.kioskSites) {
        
        [arr_Sites addObject:obj];
    }
    for (Source * obj in sourceObj.surveySites) {
        
        [arr_Sites addObject:obj];
    }
    [self.tblView_sites reloadData];
    

}
-(void) popTOView
{
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    [navigationObj popViewControllerAnimated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    navigationObj.dashBtn.hidden = YES;
    navigationObj.backBtn.hidden = NO;
    
    self.toolBarTime.hidden = YES;
    self.pickerViewTime.hidden = YES;
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
        lblTitle.text = [pickerArray_component0 objectAtIndex:row];
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
    
  
    Source * sourceObj = [arr_Sites objectAtIndex:indexPath.row];
    
    cell.lbl_title.text = sourceObj.name;
    [cell.btn_check setImage:[UIImage imageNamed:@"checkBtn.png"] forState:UIControlStateNormal];
    
    return cell;

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
    
    self.tblView_sites.hidden = NO;
    self.toolBarTime.hidden = NO;
    
    CGRect frametemp = self.tblView_sites.frame;
    
    
    frametemp.origin.y = self.view.frame.size.height-self.tblView_sites.frame.size.height;
    self.tblView_sites.frame= frametemp;
    
    CGRect frame = self.toolBarTime.frame;
    
    frame.origin.y = self.tblView_sites.frame.origin.y-44;
    
    self.toolBarTime.frame=frame;
    
}

- (IBAction)sitesArrowBtnClicked:(id)sender {
}

- (IBAction)timeArrowBtnClicked:(id)sender {
    
    
    //actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Done" destructiveButtonTitle:nil otherButtonTitles:@"",@"",@"",nil];
    
    CGRect frametemp = self.pickerViewTime.frame;
    
    
    frametemp.origin.y = self.view.frame.size.height-self.pickerViewTime.frame.size.height;
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
    
   int selected= [self.pickerViewTime selectedRowInComponent:0];
    
    lbl_TimeValue.text = [pickerArray_component0 objectAtIndex:selected];
    self.toolBarTime.hidden = YES;
    self.pickerViewTime.hidden = YES;
    self.tblView_sites.hidden = YES;
    
}
@end
