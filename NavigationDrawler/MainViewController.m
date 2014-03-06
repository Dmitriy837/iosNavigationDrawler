//
//  MainViewController.m
//  NavigationDrawler
//
//  Created by prog on 22.01.14.
//  Copyright (c) 2014 MarsSoft. All rights reserved.
//

#import "MainViewController.h"

#define kMenuAnimationDuration 0.2

@interface MainViewController ()

@end

@implementation MainViewController
{
NSInteger shift;
}

@synthesize slideOverViewController, mainMenuDisplay;

- (id)init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)mainMenu:(id)sender
{
    if (self.mainMenuDisplay) {
        [self hideBookmarks];
    }
    else
    {
        [self showBookmarks];
    }
}

- (void)hideBookmarks
{
    [UIView animateWithDuration:kMenuAnimationDuration animations:^{
        
        self.slideOverViewController.view.frame = CGRectMake(-self.navigationController.view.frame.size.width, shift, self.navigationController.view.frame.size.width - 50, self.view.frame.size.height);
        
    }completion:^(BOOL finished){
        
        self.mainMenuDisplay = NO;
        [self.slideOverViewController.view setHidden:YES];
    }];
}

- (void)showBookmarks
{
    [self.slideOverViewController.view setHidden:NO];
    [self.view addSubview:self.slideOverViewController.view];
    
    [UIView animateWithDuration:kMenuAnimationDuration animations:^{
        
        self.slideOverViewController.view.frame = CGRectMake(0, shift, self.slideOverViewController.view.frame.size.width, self.slideOverViewController.view.frame.size.height);
        
    }completion:^(BOOL finished){
        self.mainMenuDisplay = YES;
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        shift = 66;
    }
    else
    {
        shift = 0;
    }
	self.slideOverViewController = [[SlideOverViewController alloc] init];
    self.slideOverViewController.view.frame = CGRectMake(-self.navigationController.view.frame.size.width, shift, self.navigationController.view.frame.size.width - 50, self.view.frame.size.height);
    self.slideOverViewController.delegate = self;
    [self.slideOverViewController.view setBackgroundColor:[UIColor colorWithWhite:0.01 alpha:0.01]];
    
    UISwipeGestureRecognizer *leftGest = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hideBookmarks)];
    leftGest.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftGest];
    
    UISwipeGestureRecognizer *rightGest = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showBookmarks)];
    rightGest.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightGest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
