//
//  FlipNavigationController.m
//  FlipNavigation
//
//  Created by Leon on 12-12-19.
//  Copyright (c) 2012年 Leon. All rights reserved.
//


#import "FlipNavigationController.h"
#import "BaseViewController.h"

static FlipNavigationController *singleNavigationController = nil;

@interface FlipNavigationController()

@property (nonatomic, strong) NSMutableArray *innerViewControllers;

@end

@implementation FlipNavigationController

- (NSArray *)viewControllers
{
    return [self.innerViewControllers copy];
}

+ (FlipNavigationController *)sharedNavigationController
{    
    return singleNavigationController;
}

- (id)initWithRootViewController:(UIViewController *)viewController
{
    if (self = [super init]) {
        _innerViewControllers = [[NSMutableArray alloc] init];
        [_innerViewControllers addObject:viewController];
        ((BaseViewController *)viewController).flipNavigationController = self;
        [self.view addSubview:viewController.view];
        singleNavigationController = self;
    }
    return self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    BaseViewController *lastViewController = (BaseViewController *)[self.innerViewControllers lastObject];
    lastViewController.coverView.hidden = NO;
    viewController.view.frame = CGRectMake(320, 0, 320, 460);
    [self.view addSubview:viewController.view];
    [lastViewController.view bringSubviewToFront:lastViewController.coverView];
    [UIView animateWithDuration:kPushDuration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        viewController.view.frame = CGRectMake(0, 0, 320, 460);
        lastViewController.view.frame = CGRectMake(kSinkSize, kSinkSize, 320-2*kSinkSize, 460-2*kSinkSize);
        lastViewController.coverView.alpha = kMaxCoverOpacity;
    } completion:^(BOOL finished) {
        [self.innerViewControllers addObject:viewController];
    }];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if (self.innerViewControllers.count > 1) {
        UIViewController *lastViewController = [self.innerViewControllers lastObject];
        BaseViewController *preViewController = (BaseViewController *)(self.innerViewControllers[self.innerViewControllers.count-2]);
        UIView *masterView = preViewController.view;
        [UIView animateWithDuration:kPushDuration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            lastViewController.view.frame = CGRectMake(320, 0, 320, 460);
            masterView.frame = CGRectMake(0, 0, 320, 460);
            preViewController.coverView.alpha = 0;
        } completion:^(BOOL finished) {
            [lastViewController.view removeFromSuperview];
            preViewController.coverView.hidden = YES;
        }];
        
        [self.innerViewControllers removeLastObject];
        return lastViewController;
    }
    return nil;
}

@end
