//
//  FlipNavigationController.h
//  FlipNavigation
//
//  Created by Leon on 12-12-19.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#define kMaxCoverOpacity    0.3
#define kSinkSize           5
#define kPushDuration       0.4

#import <Foundation/Foundation.h>

@interface FlipNavigationController : UIViewController

@property (nonatomic, strong, readonly) NSArray *viewControllers;

+ (FlipNavigationController *)sharedNavigationController;

- (id)initWithRootViewController:(UIViewController *)viewController;
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (UIViewController *)popViewControllerAnimated:(BOOL)animated;

@end
