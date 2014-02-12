//
//  StarRatingView.h
//  StarRatingDemo
//
//  Created by HengHong on 5/4/13.
//  Copyright (c) 2013 Fixel Labs Pte. Ltd. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface StarRatingView : UIView
@property (nonatomic) int userRating;
@property (nonatomic) int rating;
@property (nonatomic,strong) UILabel* label;
-(void)ratingDidChange;
- (id)initWithFrame:(CGRect)frame andRating:(int)rating withLabel:(BOOL)label animated:(BOOL)animated;
@end