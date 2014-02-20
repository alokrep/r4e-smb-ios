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
    navigationObj.dashBtn.hidden =YES;
    
    
    self.txtViewRespond.layer.borderColor =  [[UIColor colorWithRed:195.0/255.0f green:195.0/255.0f blue:195.0/255.0f alpha:1] CGColor];
    [[self.txtViewRespond layer] setBorderWidth:1.5];
    [[self.txtViewRespond layer] setCornerRadius:4.5];
    
    //Respond TextView
    _txtViewRespond.text = @"Type your comment here...";
    _txtViewRespond.textColor = [UIColor lightGrayColor];
    _txtViewRespond.delegate = self;

	// Do any additional setup after loading the view.
}

//txtRespond delegates
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
    
    if ([text isEqualToString:@"\n"]) {
        [_txtViewRespond resignFirstResponder];
        
        [self textViewDidChange:textView];
        return YES;
    }
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
