//
//  UINavigationController+CustomAnimation.h
//  FlipNavigation
//
//  Created by Leon on 12-12-18.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (CustomAnimation)

- (void) pushController: (UIViewController*) controller
         withTransition: (UIViewAnimationTransition) transition;

@end
