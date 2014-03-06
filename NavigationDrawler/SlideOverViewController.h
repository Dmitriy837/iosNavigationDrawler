//
//  SlideOverViewController.h
//  NavigationDrawler
//
//  Created by prog on 22.01.14.
//  Copyright (c) 2014 MarsSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideOverViewController : UITableViewController
@property (nonatomic, weak) id delegate;
@property (nonatomic, assign) CGFloat firstX;
@property (nonatomic, assign) CGFloat firstY;
@end
