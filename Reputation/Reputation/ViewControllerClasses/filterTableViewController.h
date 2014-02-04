//
//  filterTableViewController.h
//  Reputation
//
//  Created by arun kumar on 2/4/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface filterTableViewController : UITableViewController<UIPickerViewDataSource,UIPickerViewDelegate,UIActionSheetDelegate>

{
    NSMutableArray *timeArray;
    NSMutableArray *reviewsArray;
    
    UIActionSheet *actionSheet;
    UIPickerView *myPickerView;
    NSMutableArray * pickerArray_component0;
    NSMutableArray *pickerArray_component1;
    NSArray * pickerArray_component3;
    NSString *str_name,*str_game,*str_country;
    UITableViewCell *cellFilter;
}

@end
