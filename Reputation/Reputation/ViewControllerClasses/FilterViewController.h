//
//  filterTableViewController.h
//  Reputation
//
//  Created by arun kumar on 2/4/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterSitesCell.h"

@interface FilterViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UIActionSheetDelegate>


{
    UserConfig * userConfigObj;
    NSMutableArray *timeArray;
    NSMutableArray *reviewsArray;
    
    UIActionSheet *actionSheet;
    UIPickerView *myPickerView;
    NSMutableArray * pickerArray_component0;
    NSMutableArray *arr_Sites;
    
    
    
    __weak IBOutlet UILabel *lbl_Sites;
    __weak IBOutlet UILabel *lbl_TimeValue;
}
- (IBAction)doneBtnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView * tblView_sites;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBarTime;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewTime;
- (IBAction)segmentValueChanged:(id)sender;
- (IBAction)sitesArrowBtnClicked:(id)sender;
- (IBAction)timeArrowBtnClicked:(id)sender;

@end
