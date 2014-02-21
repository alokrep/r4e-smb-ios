//
//  reviewsTableViewCell.h
//  Reputation
//
//  Created by arun kumar on 2/4/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface reviewsTableViewCell : UITableViewCell
@property(nonatomic,strong) IBOutlet UIButton *btn_DropDown;
@property (weak, nonatomic) IBOutlet UILabel * lbl_comment;
@property (weak, nonatomic) IBOutlet UILabel * lbl_date;
@property (weak, nonatomic) IBOutlet UILabel *  lbl_rating;
@property (weak, nonatomic) IBOutlet UILabel *  lbl_name;
@property (weak, nonatomic) IBOutlet UIImageView *  img_logoIcon;
@property (weak, nonatomic) IBOutlet UIImageView * img_dot;

@property (strong, nonatomic) IBOutlet UIImageView *imgView_dotForward;
@property (strong, nonatomic) IBOutlet UIButton *btn_forward;
@property (strong, nonatomic) IBOutlet UIButton *btn_reply;
@end
