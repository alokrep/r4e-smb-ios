//
//  ScoreController.m
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "ScoreController.h"
#import "CustomNavigation.h"
#import <QuartzCore/QuartzCore.h>

@interface ScoreController ()

@end

@implementation ScoreController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:234.0f/255.0f green:234.0f/255.0f blue:234.0f/255.0f alpha:1.0];
    
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    navigationObj.lbl_title.text = @"Score";
    [self.sliderObj setThumbImage:[UIImage imageNamed:@"slider_score.png"] forState:UIControlStateNormal];
    CustomNavigation * dashBoardNav = (CustomNavigation *)[self.tabBarController.viewControllers objectAtIndex:0];
    DashBoardController * dashViewObj = (DashBoardController *)[dashBoardNav.viewControllers objectAtIndex:0];
    [self setProgressBarUI];
    arrayValues = [dashViewObj getScoreValue];
    if (arrayValues.count>4) {
        [self setProgressValues];
    }
    
}
-(void)sendInfo :(NSMutableArray *)array
{
    if (array.count>4) {
        arrayValues = array;
        [self setProgressValues];
        
    }
    
    
}
#pragma mark SettingData in ProgressBar
-(void)setProgressValues
{
    self.progressBar_length.progress = [[arrayValues objectAtIndex:3] floatValue];
    self.progressBar_recentness.progress = [[arrayValues objectAtIndex:2] floatValue];
    self.progressBar_spread.progress=[[arrayValues objectAtIndex:4] floatValue];
    self.progressBar_visibility.progress = [[arrayValues objectAtIndex:5] floatValue];
    self.progressBar_weightedAvg.progress = [[arrayValues objectAtIndex:0] floatValue];
    self.progressBar_volume.progress = [[arrayValues objectAtIndex:1] floatValue];
    int score = [[arrayValues lastObject] intValue];
    self.sliderObj.value = score;
    self.lbl_overScore.text = [NSString stringWithFormat:@"%d",score];;
    
    [self setProgressColor:self.progressBar_weightedAvg :self.progressBar_weightedAvg.progress];
    [self setProgressColor:self.progressBar_length :self.progressBar_length.progress];
    [self setProgressColor:self.progressBar_spread :self.progressBar_spread.progress];
    [self setProgressColor:self.progressBar_visibility :self.progressBar_visibility.progress];
    [self setProgressColor:self.progressBar_recentness :self.progressBar_recentness.progress];
    [self setProgressColor:self.progressBar_volume :self.progressBar_volume.progress];
    
    
    
    self.lbl_volumeValue.text =[NSString stringWithFormat:@"%.0f%%", (self.progressBar_volume.progress * 100)];
    self.lbl_recentnessValue.text =[NSString stringWithFormat:@"%.0f%%", (self.progressBar_recentness.progress * 100)];
    self.lbl_lenghtValue.text =[NSString stringWithFormat:@"%.0f%%", (self.progressBar_length.progress * 100)];
    self.lbl_spreadValue.text =[NSString stringWithFormat:@"%.0f%%", (self.progressBar_spread.progress * 100)];
    self.lbl_visiblityValue.text =[NSString stringWithFormat:@"%.0f%%", (self.progressBar_visibility.progress * 100)];
    self.lbl_weightedavgValue.text =[NSString stringWithFormat:@"%.0f%%", (self.progressBar_weightedAvg.progress * 100)];
    
    
    // setting Values frame
    self.lbl_weightedavgValue.frame = CGRectMake(self.lbl_weightedavgValue.frame.origin.x,self.lbl_weightedavgValue.frame.origin.y-((self.progressBar_weightedAvg.progress*120)/2) , 34, 23);
    
    self.lbl_lenghtValue.frame = CGRectMake(self.lbl_lenghtValue.frame.origin.x,self.lbl_lenghtValue.frame.origin.y-((self.progressBar_length.progress*120)/2) , 34, 23);
    
    self.lbl_recentnessValue.frame = CGRectMake(self.lbl_recentnessValue.frame.origin.x,self.lbl_recentnessValue.frame.origin.y-((self.progressBar_recentness.progress*120)/2) , 34, 23);
    
    self.lbl_spreadValue.frame = CGRectMake(self.lbl_spreadValue.frame.origin.x,self.lbl_spreadValue.frame.origin.y-((self.progressBar_spread.progress*120)/2) , 34, 23);
    
    self.lbl_visiblityValue.frame = CGRectMake(self.lbl_visiblityValue.frame.origin.x,self.lbl_visiblityValue.frame.origin.y-((self.progressBar_visibility.progress*120)/2) , 34, 23);
    
    self.lbl_volumeValue.frame = CGRectMake(self.lbl_volumeValue.frame.origin.x,self.lbl_volumeValue.frame.origin.y-((self.progressBar_volume.progress*120)/2) , 34, 23);
    
    //setting arrows frame
    self.arrowImg_weightedAvg.frame = CGRectMake(self.arrowImg_weightedAvg.frame.origin.x,self.arrowImg_weightedAvg.frame.origin.y-((self.progressBar_weightedAvg.progress*120)/2) , 6, 8);
    
    self.arrowImg_volume.frame = CGRectMake(self.arrowImg_volume.frame.origin.x,self.arrowImg_volume.frame.origin.y-((self.progressBar_volume.progress*120)/2) , 6, 8);
    
    self.arrowImg_recentness.frame = CGRectMake(self.arrowImg_recentness.frame.origin.x,self.arrowImg_recentness.frame.origin.y-((self.progressBar_recentness.progress*120)/2) , 6, 8);
    
    self.arrowImg_length.frame = CGRectMake(self.arrowImg_length.frame.origin.x,self.arrowImg_length.frame.origin.y-((self.progressBar_length.progress*120)/2) , 6, 8);
    
    self.arrowImg_spread.frame = CGRectMake(self.arrowImg_spread.frame.origin.x,self.arrowImg_spread.frame.origin.y-((self.progressBar_spread.progress*120)/2) , 6, 8);
    
    self.arrowImg_visibility.frame = CGRectMake(self.arrowImg_visibility.frame.origin.x,self.arrowImg_visibility.frame.origin.y-((self.progressBar_visibility.progress*120)/2) , 6, 8);
    
    
}
#pragma mark SettingUI of ProgressBar
-(void)setProgressBarUI
{
    self.self.progressBar_weightedAvg.transform=CGAffineTransformMakeRotation(M_PI_2+M_PI);
    self.progressBar_weightedAvg.layer.borderColor=[[UIColor grayColor] CGColor];
    self.progressBar_weightedAvg.layer.borderWidth =.5;
    self.progressBar_weightedAvg.layer.cornerRadius = 2.0;
    self.progressBar_weightedAvg.layer.masksToBounds = YES;
    
    self.progressBar_volume.transform=CGAffineTransformMakeRotation(M_PI_2+M_PI);
    self.progressBar_volume.layer.borderColor=[[UIColor grayColor] CGColor];
    self.progressBar_volume.layer.borderWidth =.5;
    self.progressBar_volume.layer.cornerRadius = 2.0;
    self.progressBar_volume.layer.masksToBounds = YES;
    
    self.progressBar_visibility.transform=CGAffineTransformMakeRotation(M_PI_2+M_PI);
    self.progressBar_visibility.layer.borderColor=[[UIColor grayColor] CGColor];
    self.progressBar_visibility.layer.borderWidth =.5;
    self.progressBar_visibility.layer.cornerRadius = 2.0;
    self.progressBar_visibility.layer.masksToBounds = YES;
    
    self.progressBar_spread.transform=CGAffineTransformMakeRotation(M_PI_2+M_PI);
    self.progressBar_spread.layer.borderColor=[[UIColor grayColor] CGColor];
    self.progressBar_spread.layer.borderWidth =.5;
    self.progressBar_spread.layer.cornerRadius = 2.0;
    self.progressBar_spread.layer.masksToBounds = YES;
    
    self.progressBar_recentness.transform=CGAffineTransformMakeRotation(M_PI_2+M_PI);
    self.progressBar_recentness.layer.borderColor=[[UIColor grayColor] CGColor];
    self.progressBar_recentness.layer.borderWidth =.5;
    self.progressBar_recentness.layer.cornerRadius = 2.0;
    self.progressBar_recentness.layer.masksToBounds = YES;
    
    self.progressBar_length.transform=CGAffineTransformMakeRotation(M_PI_2+M_PI);
    self.progressBar_length.layer.borderColor=[[UIColor grayColor] CGColor];
    self.progressBar_length.layer.borderWidth =.5;
    self.progressBar_length.layer.cornerRadius = 2.0;
    self.progressBar_length.layer.masksToBounds = YES;
    
    
    [self initRoundedFatProgressBar];
    
    
    
    
}
#pragma mark SettingColor in ProgressBar
-(void)setProgressColor:(YLProgressBar *)progressBar :(float )value
{
    
    NSArray *tintColors; //= @[[UIColor colorWithRed:33.0/255.0f green:180.0/255.0f blue:162.0/255.0f alpha:1.0f],
    
    value = value*1000;
    if (value>0 && value<200) {
        tintColors = @[[UIColor colorWithRed:128.0/255.0f green:0.0/255.0f blue:15.0/255.0f alpha:1.0f]];
        
        progressBar.progressTintColors= tintColors;
        
    }
    else if (value>200 && value<400)
    {
        tintColors = @[[UIColor colorWithRed:168.0/255.0f green:68.0/255.0f blue:11.0/255.0f alpha:1.0f]];
        progressBar.progressTintColors= tintColors;
    }
    else if (value>400 && value<600)
    {
        tintColors = @[[UIColor colorWithRed:175.0/255.0f green:137.0/255.0f blue:0.0/255.0f alpha:1.0f]];
        progressBar.progressTintColors=  tintColors;
    }
    else if (value>600 && value<800)
    {
        tintColors = @[[UIColor colorWithRed:124.0/255.0f green:177.0/255.0f blue:0.0/255.0f alpha:1.0f]];
        progressBar.progressTintColors=  tintColors;
        
    }
    else if (value>800 && value<1000)
    {
        tintColors = @[[UIColor colorWithRed:69.0/255.0f green:146.0/255.0f blue:0.0/255.0f alpha:1.0f]];
        progressBar.progressTintColors=  tintColors;
        
    }
}
#pragma mark SettingLayout in ProgressBar
- (void)initRoundedFatProgressBar
{
    
    
    // day progress bar
    
    // progrssBar_days.behavior=YLProgressBarBehaviorIndeterminate;
    self.progressBar_weightedAvg.stripesOrientation       = 0;
    self.progressBar_weightedAvg.type=YLProgressBarTypeFlat;
    
    self.progressBar_weightedAvg.indicatorTextDisplayMode=0;
    
    
    
    
    self.progressBar_length.stripesOrientation       = 0;
    self.progressBar_length.type=YLProgressBarTypeFlat;
    self.progressBar_length.indicatorTextDisplayMode=0;
    
    
    self.progressBar_recentness.stripesOrientation       = 0;
    self.progressBar_recentness.type=YLProgressBarTypeFlat;
    
    self.progressBar_recentness.indicatorTextDisplayMode=0;
    
    
    self.progressBar_spread.stripesOrientation       = 0;
    self.progressBar_spread.type=YLProgressBarTypeFlat;
    self.progressBar_spread.indicatorTextDisplayMode=0;
    
    
    self.progressBar_visibility.stripesOrientation       = 0;
    self.progressBar_visibility.type=YLProgressBarTypeFlat;
    
    self.progressBar_visibility.indicatorTextDisplayMode=0;
    
    
    self.progressBar_volume.stripesOrientation       = 0;
    self.progressBar_volume.type=YLProgressBarTypeFlat;
    
    self.progressBar_volume.indicatorTextDisplayMode=0;
    
    //self.lbl_volumeValue.text =self.progressBar_volume.indicatorTextLabel.text;
    
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //jai
    
    UITouch *touch;
    touch=[touches anyObject];
    
    
    if ([[touch view] isKindOfClass:[YLProgressBar class]]) {
        
        [self factorsBtnClicked:[touch view]];
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)factorsBtnClicked:(id)sender {
    
    switch ([sender tag]) {
        case 0:
            [self.imgVw_varientArrow setImage:[UIImage imageNamed:@"scoreUpArrow.png"]];
            [self.imgVw_varientArrow setFrame:CGRectMake(35, 238, self.imgVw_varientArrow.frame.size.width,  self.imgVw_varientArrow.frame.size.height)];
            break;
        case 1:
            [self.imgVw_varientArrow setImage:[UIImage imageNamed:@"scoreUpArrow.png"]];
            [self.imgVw_varientArrow setFrame:CGRectMake(140, 238, self.imgVw_varientArrow.frame.size.width,  self.imgVw_varientArrow.frame.size.height)];
            break;
        case 2:
            [self.imgVw_varientArrow setImage:[UIImage imageNamed:@"scoreUpArrow.png"]];
            [self.imgVw_varientArrow setFrame:CGRectMake(250, 238, self.imgVw_varientArrow.frame.size.width,  self.imgVw_varientArrow.frame.size.height)];
            break;
        case 3:
            [self.imgVw_varientArrow setImage:[UIImage imageNamed:@"scoreDownArrow.png"]];
            [self.imgVw_varientArrow setFrame:CGRectMake(35, 328, self.imgVw_varientArrow.frame.size.width,  self.imgVw_varientArrow.frame.size.height)];
            break;
        case 4:
            [self.imgVw_varientArrow setImage:[UIImage imageNamed:@"scoreDownArrow.png"]];
            [self.imgVw_varientArrow setFrame:CGRectMake(140,328, self.imgVw_varientArrow.frame.size.width,  self.imgVw_varientArrow.frame.size.height)];
            break;
        case 5:
            [self.imgVw_varientArrow setImage:[UIImage imageNamed:@"scoreDownArrow.png"]];
            [self.imgVw_varientArrow setFrame:CGRectMake(250, 328, self.imgVw_varientArrow.frame.size.width,  self.imgVw_varientArrow.frame.size.height)];
            break;
            
        default:
            break;
    }
}
@end
