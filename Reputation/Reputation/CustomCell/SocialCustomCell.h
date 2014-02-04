//
//  SocialCustomCell.h
//  Reputation
//
//  Created by jai sharma on 2/3/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SocialCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgVw_icon;
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UILabel *lbl_postValue;
@property (weak, nonatomic) IBOutlet UILabel *lbl_middleValue;
@property (weak, nonatomic) IBOutlet UILabel *lbl_shares;
@property (weak, nonatomic) IBOutlet UILabel *lbl_postTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbl_middleTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbl_shareTitle;

@end
