//
//  DNNoteViewController.m
//  DaNotes
//
//  Created by Kunwar on 9/3/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//

#import "DNNoteViewController.h"

@interface DNNoteViewController ()
{
    UILabel *_dateLabel;
    UITextView *_textView;
}
@end

@implementation DNNoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _dateLabel = [UILabel new];
        _textView = [UITextView new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _dateLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:_dateLabel];
    
    [self.view addSubview:_textView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGFloat x = 0, y = 20, width = CGRectGetWidth(self.view.bounds), height = 30;
    _dateLabel.frame = CGRectMake(x, y, width, height);
    
    y = CGRectGetMaxY(_dateLabel.frame), height = CGRectGetHeight(self.view.bounds) - CGRectGetMaxY(_dateLabel.frame);
    _textView.frame = CGRectMake(x, y, width, height);
}

#pragma mark - Public methods

- (void)setDate:(NSDate *)date
{
    _date = date;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    _dateLabel.text = [dateFormatter stringFromDate:date];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
