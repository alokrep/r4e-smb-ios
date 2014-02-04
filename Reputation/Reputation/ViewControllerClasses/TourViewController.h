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
@property (weak, nonatomic) IBOutlet UILabel *lbl_tourTitle;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollVw;

@end
