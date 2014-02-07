//
//  DashBoardController.h
//  Reputation
//
//  Created by Jai.Sharma on 1/31/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReviewCustomCell.h"
#import "SocialCustomCell.h"
#import <QuartzCore/QuartzCore.h>
#import "Mobile.h"
#import "TProtocol.h"
#import "TApplicationException.h"
#import "TProtocolUtil.h"
#import "TProcessor.h"
#import "TObjective-C.h"
#import "TTransport.h"
#import "THMACHttpClient.h"
#import "TBinaryProtocol.h"
#import "MobileAuth.h"


@interface DashBoardController : UIViewController

@property (strong,nonatomic) NSMutableArray * arr_reviewsData;
@property (strong,nonatomic) NSMutableArray * arr_SocialData;
@property (weak, nonatomic) IBOutlet UITableView *tblVw_review;
@property (weak, nonatomic) IBOutlet UITableView *tblVwSocial;

@end
