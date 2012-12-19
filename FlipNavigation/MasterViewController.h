//
//  MasterViewController.h
//  FlipNavigation
//
//  Created by Leon on 12-12-18.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@class DetailViewController;

@interface MasterViewController : BaseViewController

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
