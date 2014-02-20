//
//  RespondViewController.m
//  Reputation
//
//  Created by arun kumar on 2/20/14.
//  Copyright (c) 2014 www. All rights reserved.
//

#import "RespondViewController.h"

@interface RespondViewController ()

@end

@implementation RespondViewController
@synthesize str_reviewID;
@synthesize isForwarded;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLayoutSubviews
{
    self.txtViewRespond.contentInset = UIEdgeInsetsMake(0,8,0,0);
    CGSize size=self.txtViewRespond.contentSize;
    size.width=size.width-50;
    [self.txtViewRespond setContentSize:size];
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    navigationObj.lbl_title.text = @"Respond";
    [navigationObj.cancelBtn addTarget:self action:@selector(cancelBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [navigationObj.sendBtn addTarget:self action:@selector(sendBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
   
    
    self.txtViewRespond.layer.borderColor =  [[UIColor colorWithRed:195.0/255.0f green:195.0/255.0f blue:195.0/255.0f alpha:1] CGColor];
    [[self.txtViewRespond layer] setBorderWidth:1.5];
    [[self.txtViewRespond layer] setCornerRadius:4.5];
    
    //Respond TextView
    _txtViewRespond.text = @"Type your comment here...";
    _txtViewRespond.textColor = [UIColor lightGrayColor];
    _txtViewRespond.delegate = self;

	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    navigationObj.lbl_title.text = @"Respond";
    navigationObj.dashBtn.hidden =YES;
    navigationObj.cancelBtn.hidden = NO;
    navigationObj.sendBtn.hidden = NO;
   
    if (!self.isForwarded) {
        self.txtFldEmail.hidden = YES;
        CGRect frame =  self.txtViewRespond.frame;
        
        frame.origin.y = 50;
        self.txtViewRespond.frame=frame;
    }
    else
    {
        self.txtFldEmail.hidden = NO;
        CGRect frame =  self.txtViewRespond.frame;
        
        frame.origin.y = 224;
        self.txtViewRespond.frame=frame;
    }
}
- (void)viewWillDisappear:(BOOL)animated
{
    CustomNavigation * navigationObj = (CustomNavigation *)self.navigationController;
    navigationObj.cancelBtn.hidden = YES;
    navigationObj.sendBtn.hidden = YES;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.str_reviewID = nil;
    self.reviewObj = nil;
    
}

//txtRespond delegates

-(void)cancelBtnClicked: (id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)sendBtnClicked: (id )sender
{
    
    NSString * str_email;
    if(!self.isForwarded)
    {
        str_email = self.reviewObj.reviewerEmail;
        
        if (self.txtViewRespond.text.length>0 && [self.txtViewRespond.text isEqualToString:@"Type your comment here..."]) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please eneter your message" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            alert = nil;
            return;
        }
        
    }
    else
    {
        if (self.txtViewRespond.text.length>0 && [self.txtViewRespond.text isEqualToString:@"Type your comment here..."]) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please eneter your message" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            alert = nil;
            return;
        }
        if (self.txtFldEmail.text.length<=0 ) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter Email Address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            alert = nil;
            return;
        }
        str_email= self.txtFldEmail.text;
    }
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
   
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_async(queue, ^{
        
        
        THMACHttpClient *httpTwoClient = [[THMACHttpClient alloc] initWithURL:[NSURL URLWithString:kServiceURL] userId:[AppDelegate sharedDelegate].userObj.email secret:[AppDelegate sharedDelegate].userObj.userKey];
        
        TBinaryProtocol *protocol2 = [[TBinaryProtocol alloc] initWithTransport:httpTwoClient strictRead:YES strictWrite:YES];
        MobileClient *serviceTwo = [[MobileClient alloc] initWithProtocol:protocol2];
    //   KIOSK_dace50f92daa9861099a81cc99f8324f_36bc1d1f90cd6d57c4c73c6a71c0bd7b
    //    RatingResponse * response =[serviceTwo replyToRating:self.str_reviewID recepientEmail:str_email message:self.txtViewRespond.text isForward:self.isForwarded];
         RatingResponse * response =[serviceTwo replyToRating:@"KIOSK_dace50f92daa9861099a81cc99f8324f_36bc1d1f90cd6d57c4c73c6a71c0bd7b" recepientEmail:str_email message:self.txtViewRespond.text isForward:self.isForwarded];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            if (response.response.responseCode== ResponseCode_Success) {
                
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Your message has been sent successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                [self.txtViewRespond resignFirstResponder];
                alert = nil;
            }
            else
            {
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Failed" message:response.response.error.message  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                alert = nil;

            }
        });
        
    });

    
    
}
- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
{
    if (buttonIndex==0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
}
- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqual:@"Type your comment here..."])
    {
        textView.text = @"";
    }
    _txtViewRespond.textColor = [UIColor blackColor];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    
    if(_txtViewRespond.text.length == 0){
        _txtViewRespond.textColor = [UIColor lightGrayColor];
        _txtViewRespond.text = @"Type your comment here...";
        [_txtViewRespond resignFirstResponder];
    }
}



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if ([text isEqualToString:@"\n"])
    {
        [_txtViewRespond resignFirstResponder];
        [self textViewDidChange:textView];
        return YES;
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
