//
//  MainViewController.h
//  NavigationDrawler
//
//  Created by prog on 22.01.14.
//  Copyright (c) 2014 MarsSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideOverViewController.h"

@interface MainViewController : UIViewController
@property (nonatomic, retain) SlideOverViewController* slideOverViewController;
@property (nonatomic, assign) BOOL mainMenuDisplay;

- (IBAction)mainMenu:(id)sender;
@end
