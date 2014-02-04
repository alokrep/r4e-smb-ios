//
//  TourViewController.m
//  Reputation
//
//  Created by jai sharma on 2/4/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "TourViewController.h"

@interface TourViewController ()

@end

@implementation TourViewController
@synthesize scrollVw;

@synthesize arr_imageContent , arr_imageTitleLabel;
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
    
    self.scrollVw = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 323)];
    self.scrollVw.pagingEnabled = YES;
    self.scrollVw.delegate = self;
    
    
    //Adding Images In Array
    self.arr_imageContent = [[NSMutableArray alloc]init];
    UIImage *img1 = [UIImage imageNamed:@"help1.png"];
    UIImage *img2 = [UIImage imageNamed:@"help2.png"];
    UIImage *img3 = [UIImage imageNamed:@"help3.png"];
    UIImage *img4 = [UIImage imageNamed:@"help4.png"];
    [self.arr_imageContent addObject:img1];
    [self.arr_imageContent addObject:img2];
    [self.arr_imageContent addObject:img3];
    [self.arr_imageContent addObject:img4];
    
    
    // Adding Label in array
    self.arr_imageTitleLabel = [[NSMutableArray alloc]init];
    [self.arr_imageTitleLabel addObject:@"Find your navigation menus here"];
    [self.arr_imageTitleLabel addObject:@"Notifications will inform you of reviews"];
    [self.arr_imageTitleLabel addObject:@"Select the reviews or social tab to show your current ratings or social reviews"];
    [self.arr_imageTitleLabel addObject:@"See the report of activities on Reputation Summary"];
    
    
    //Adding Images On Scroll View
    for (int i = 0; i<[self.arr_imageContent count]; i++) {
        UIImageView *imgVIew = [[UIImageView alloc]initWithFrame:CGRectMake(320*i, 0, 320, 323)];
        [imgVIew setImage:[self.arr_imageContent objectAtIndex:i]];
        [self.scrollVw addSubview:imgVIew];
    }
    self.scrollVw.contentSize = CGSizeMake([self.arr_imageContent count]*320,323);
    [self.view addSubview:self.scrollVw];
    
    self.pageControl_obj.numberOfPages = [self.arr_imageContent count];
    self.lbl_tourTitle.text = [self.arr_imageTitleLabel objectAtIndex:0];
    
}

#pragma mark
#pragma mark Page Control Value Chnage
- (IBAction)PageControlValueChanged{
    
    self.scrollVw.contentOffset = CGPointMake(self.pageControl_obj.currentPage*320, 0);
    self.lbl_tourTitle.text = [self.arr_imageTitleLabel objectAtIndex:self.pageControl_obj.currentPage];
}

#pragma mark
#pragma mark UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
    NSLog(@"%f",self.scrollVw.contentOffset.x);
    
    CGFloat pageWidth = self.scrollVw.frame.size.width;
    int page = floor((self.scrollVw.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl_obj.currentPage = page;

    self.lbl_tourTitle.text = [self.arr_imageTitleLabel objectAtIndex:page];
    
    if (self.scrollVw.contentOffset.x>(([self.arr_imageContent count]-1)*320)){
        [self.view removeFromSuperview];
        self.view = nil;
    }
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
