//
//  BaseViewController.h
//  FlipNavigation
//
//  Created by Leon on 12-12-19.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlipNavigationController.h"

@interface BaseViewController : UIViewController

@property (nonatomic, weak) UIView *coverView;
@property (nonatomic, weak) FlipNavigationController *flipNavigationController;

@end
