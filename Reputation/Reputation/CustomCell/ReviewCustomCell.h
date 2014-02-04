//
//  ReviewCustomCell.h
//  Reputation
//
//  Created by jai sharma on 2/3/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReviewCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_titleName;
@property (weak, nonatomic) IBOutlet UILabel *lbl_reviewsNumber;
@property (weak, nonatomic) IBOutlet UILabel *lbl_points;
@property (weak, nonatomic) IBOutlet UIImageView *imgVw_rating;
@property (weak, nonatomic) IBOutlet UIImageView *imgVw_icon;

@end
