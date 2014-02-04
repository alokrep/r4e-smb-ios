//
//  reviewsViewController.m
//  Reputation
//
//  Created by arun kumar on 2/4/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "reviewsViewController.h"
#import "reviewsTableViewCell.h"
#import "filterTableViewController.h"

@interface reviewsViewController ()

@end

@implementation reviewsViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        }
        return cellFilter;
    }
reviewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = (reviewsTableViewCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.btn_DropDown.tag = indexPath.row;
    
    
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
    return 5;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"filterVC" sender:self];
    }
    else
    {
        NSString *other1 = @"Reply";
        NSString *other2 = @"Full View";
        NSString *other3 = @"Mark as Read";
        NSString *other4 = @"Email Review";
        NSString *other5 = @"Share";
        NSString *cancelTitle = @"Cancel";
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:cancelTitle destructiveButtonTitle:nil otherButtonTitles:other1,other2,other3,other4,other5, nil];
        [actionSheet showInView:self.view];
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

//[self performSegueWithIdentifier:@"filterVC" sender:self];

- (IBAction)btn_arrow:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(reviewsTableViewCell *)
                              [[[sender superview] superview] superview]];
    NSLog(@"The row id is %d",  indexPath.row);
    NSString *other1 = @"Reply";
    NSString *other2 = @"Full View";
    NSString *other3 = @"Mark as Read";
    NSString *other4 = @"Email Review";
    NSString *other5 = @"Share";
    NSString *cancelTitle = @"Cancel";
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:cancelTitle destructiveButtonTitle:nil otherButtonTitles:other1,other2,other3,other4,other5, nil];
    [actionSheet showInView:self.view];
    
}
@end
