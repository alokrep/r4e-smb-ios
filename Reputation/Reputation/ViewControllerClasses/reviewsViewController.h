//
//  reviewsViewController.h
//  Reputation
//
//  Created by arun kumar on 2/4/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface reviewsViewController : UITableViewController<UIActionSheetDelegate>

{
    IBOutlet UITableView *tbl_View;
}
- (IBAction)btn_arrow:(id)sender;

@end
