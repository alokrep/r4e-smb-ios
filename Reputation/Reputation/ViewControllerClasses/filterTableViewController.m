//
//  filterTableViewController.m
//  Reputation
//
//  Created by arun kumar on 2/4/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "filterTableViewController.h"
#import "CustomNavigation.h"

@interface filterTableViewController ()

@end

@implementation filterTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    timeArray = [[NSMutableArray alloc] init];
    reviewsArray = [[NSMutableArray alloc] init];
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    navigationObj.lbl_title.text = @"Filter";
    
    // Add some data for demo purposes.
    pickerArray_component0 = [[NSMutableArray alloc]initWithObjects:                            @"yahoo",@"twitter",@"facebook",@"gmail", nil];
    //pickerArray_component0 = [[NSMutableArray alloc]initWithObjects:@"", nil];

}
- (void)viewWillAppear:(BOOL)animated
{
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    navigationObj.dashBtn.hidden = YES;
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if(component== 0){
        UILabel *lblTitle = [[UILabel alloc] init];
        lblTitle.frame = CGRectMake(120, 100, 72, 220);
        lblTitle.text = [pickerArray_component0 objectAtIndex:row];
        return lblTitle;
    }

    return nil;
    
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        cellFilter.detailTextLabel.text = str_game;
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
    return 70;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component==0)
    {
        str_game=[pickerArray_component0 objectAtIndex:row];
        [cellFilter reloadInputViews ];
    }
   
}


/* For me the number of items in the UIPickerView is known on compile time. So here I just return 3 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return 4;

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    if (section == 0) {
        return 1;
    }
    else if (section == 1)
    return 3;
    else
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0)
    {

        actionSheet = [[UIActionSheet alloc] initWithTitle:@"share" delegate:self cancelButtonTitle:@"Done" destructiveButtonTitle:nil otherButtonTitles:nil];

        UIPickerView* positionPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0,100, 320, 200)];
        positionPicker.dataSource = self;
        positionPicker.delegate = self;
        positionPicker.showsSelectionIndicator=YES;

        [actionSheet addSubview:positionPicker];

        [actionSheet showInView:self.view];
        [actionSheet setBounds:CGRectMake(0,0, 320, 480)];
    }

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"reviewCell";
    
    
        cellFilter = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cellFilter == nil)
        {
            cellFilter = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
            cellFilter.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

//    
//    UITableViewCell *cell = [super tableView:tableView
//                       cellForRowAtIndexPath:indexPath];
    
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    switch (section)
    {
        case 0:
            if(row == 0)
                cellFilter.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cellFilter.textLabel.text =@"Time";
                cellFilter.detailTextLabel.text = @"Last 30 days";
            
            break;
            
        case 1:
            if(row == 0){
                cellFilter.accessoryType = UITableViewCellAccessoryCheckmark;
                cellFilter.textLabel.text =@"Positive Reviews";
                UISwitch *positiveSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
                cellFilter.accessoryView = positiveSwitch;
                cellFilter.detailTextLabel.text = nil;
            }
            if(row == 1){
                cellFilter.accessoryType = UITableViewCellAccessoryDetailButton;
                cellFilter.textLabel.text =@"Neutral Reviews";
            UISwitch *neutralSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
            cellFilter.accessoryView = neutralSwitch;
            cellFilter.detailTextLabel.text = nil;
            }
            if(row == 2){
                cellFilter.accessoryType = UITableViewCellAccessoryDetailButton;
                cellFilter.textLabel.text =@"Negative Reviews";
            UISwitch *negativeSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
            cellFilter.accessoryView = negativeSwitch;
            cellFilter.detailTextLabel.text = nil;
            }
            break;
        case 2:
                cellFilter.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cellFilter.textLabel.text =@"Review Sites";
                cellFilter.detailTextLabel.text = @"All";
            
            break;
    }
    return cellFilter;

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

@end
