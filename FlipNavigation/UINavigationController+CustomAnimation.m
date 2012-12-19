//
//  UINavigationController+CustomAnimation.m
//  FlipNavigation
//
//  Created by Leon on 12-12-18.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import "UINavigationController+CustomAnimation.h"

@implementation UINavigationController (CustomAnimation)

- (void) pushController: (UIViewController*) controller
         withTransition: (UIViewAnimationTransition) transition
{
    [UIView beginAnimations:nil context:NULL];
    [self pushViewController:controller animated:NO];
    [UIView setAnimationDuration:.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];
    
    
    
}

@end
