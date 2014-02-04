//
//  reviewsTableViewCell.m
//  Reputation
//
//  Created by arun kumar on 2/4/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "reviewsTableViewCell.h"

@implementation reviewsTableViewCell
@synthesize btn_DropDown;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
