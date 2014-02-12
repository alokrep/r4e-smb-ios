//
//  ScoreController.h
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLProgressBar.h"
#import "DashBoardController.h"

@interface ScoreController : UIViewController

{
    NSArray * arrayValues;
//    IBOutlet YLProgressBar *progressBar_weightedAvg;
//    IBOutlet YLProgressBar *progressBar_volume;
//    IBOutlet YLProgressBar *progressBar_recentness;
//    IBOutlet YLProgressBar *progressBar_length;
//    IBOutlet YLProgressBar *progressBar_spread;
//    IBOutlet YLProgressBar *progressBar_visibility;
}
@property (weak, nonatomic) IBOutlet UISlider * sliderObj;
@property (weak, nonatomic) IBOutlet UILabel *lbl_volumeValue;
@property (weak, nonatomic) IBOutlet UILabel *lbl_recentnessValue;
@property (weak, nonatomic) IBOutlet UILabel *lbl_lenghtValue;
@property (weak, nonatomic) IBOutlet UILabel *lbl_spreadValue;
@property (weak, nonatomic) IBOutlet UILabel *lbl_visiblityValue;
@property (weak, nonatomic) IBOutlet UILabel *lbl_overScore;

@property (weak, nonatomic) IBOutlet UIImageView *arrowImg_weightedAvg;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImg_volume;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImg_recentness;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImg_length;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImg_spread;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImg_visibility;

@property (weak, nonatomic) IBOutlet UILabel *lbl_weightedavgValue;
@property (weak, nonatomic) IBOutlet YLProgressBar *progressBar_length;
@property (weak, nonatomic) IBOutlet YLProgressBar *progressBar_spread;
@property (weak, nonatomic) IBOutlet YLProgressBar *progressBar_visibility;

@property (weak, nonatomic) IBOutlet YLProgressBar *progressBar_weightedAvg;
@property (weak, nonatomic) IBOutlet YLProgressBar *progressBar_volume;
@property (weak, nonatomic) IBOutlet YLProgressBar *progressBar_recentness;

@property (weak, nonatomic) IBOutlet UIImageView *imgVw_varientArrow;

-(void)sendInfo :(NSMutableArray *)array;
- (IBAction)factorsBtnClicked:(id)sender;

@end
