//
//  DNRootViewController.m
//  DaNotes
//
//  Created by Kunwar on 8/13/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//

#import "DNRootViewController.h"
#import "DNNoteViewController.h"

@interface DNRootViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>
{
    UITableView *_tableView;
    UIPageViewController *_pageViewController;
}

@end

@implementation DNRootViewController

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
    // Do any additional setup after loading the view.
    
    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationVertical options:nil];
    
    DNNoteViewController *noteViewController = [DNNoteViewController new];
    noteViewController.date = [NSDate date];
    
    [_pageViewController setViewControllers:@[noteViewController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        
    }];
    _pageViewController.delegate = self;
    _pageViewController.dataSource = self;
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    _pageViewController.view.frame = self.view.bounds;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    DNNoteViewController *noteViewController = (DNNoteViewController *)viewController;
    
    NSDate *previousDate = [noteViewController.date dateByAddingOffset:-1];
    
    DNNoteViewController *beforeViewController = [DNNoteViewController new];
    beforeViewController.date = previousDate;
    
    return beforeViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    DNNoteViewController *noteViewController = (DNNoteViewController *)viewController;
    
    NSDate *nextDate = [noteViewController.date dateByAddingOffset:1];
    
    DNNoteViewController *nextViewController = [DNNoteViewController new];
    nextViewController.date = nextDate;
    
    return nextViewController;
}


@end
