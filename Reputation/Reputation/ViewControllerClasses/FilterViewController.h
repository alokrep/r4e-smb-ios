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
    
    
   
    NSMutableArray * pickerArray_component0;
    NSMutableArray *arr_Sites;
    NSMutableDictionary * dict_check;
    
    
    
    __weak IBOutlet UILabel *lbl_Sites;
    __weak IBOutlet UILabel *lbl_TimeValue;
}
- (IBAction)doneBtnClicked:(id)sender;
@property (nonatomic,strong) NSMutableArray * arr_selectedSites;

@property (weak, nonatomic) IBOutlet UISwitch * switchPositive;
@property (weak, nonatomic) IBOutlet UISwitch * switchNeutral;
@property (weak, nonatomic) IBOutlet UISwitch * switchNegative;
@property (weak, nonatomic) IBOutlet UITableView * tblView_sites;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBarTime;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewTime;
- (IBAction)segmentValueChanged:(id)sender;
- (IBAction)sitesArrowBtnClicked:(id)sender;
- (IBAction)timeArrowBtnClicked:(id)sender;

@end
