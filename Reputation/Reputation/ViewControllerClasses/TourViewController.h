//
//  TourViewController.h
//  Reputation
//
//  Created by jai sharma on 2/4/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TourViewController : UIViewController<UIScrollViewDelegate>
{
    
}

// Outlets
@property (weak, nonatomic) IBOutlet UILabel *lbl_tourTitle;
@property (weak , nonatomic) IBOutlet UIPageControl   *pageControl_obj;

@property (strong, nonatomic) UIScrollView *scrollVw;

// Data Structure
@property (strong , nonatomic) NSMutableArray    *arr_imageContent;
@property (strong , nonatomic) NSMutableArray    *arr_imageTitleLabel;


- (IBAction)PageControlValueChanged;

@end
