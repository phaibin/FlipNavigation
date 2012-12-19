//
//  BaseViewController.m
//  FlipNavigation
//
//  Created by Leon on 12-12-19.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import "BaseViewController.h"

#define kMinMoveDistance    60

@interface BaseViewController ()

@end

@implementation BaseViewController
{
    CGPoint _beginPoint;
    float _beginX;
    float _beginMasterViewX;
    float _beginAlpha;
    float _move;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _flipNavigationController = [FlipNavigationController sharedNavigationController];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIView *coverView = [[UIView alloc] initWithFrame:self.view.bounds];
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0;
    coverView.hidden = YES;
    [self.view addSubview:coverView];
    self.coverView = coverView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    BaseViewController *masterViewController = (BaseViewController *)self.flipNavigationController.viewControllers[self.flipNavigationController.viewControllers.count-2];
    UIView *masterView = masterViewController.view;
    
    UITouch *touch = [touches anyObject];
    _beginPoint = [touch locationInView:self.view.superview];
    _beginX = self.view.center.x;
    _beginMasterViewX = masterView.frame.origin.x;
    _beginAlpha = masterViewController.coverView.alpha;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.flipNavigationController.viewControllers.count < 2)
        return;
    
    UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:self.view.superview];
    _move = endPoint.x-_beginPoint.x;
//    NSLog(@"move: %f", _move);
    float newX = _beginX + _move;
    if (newX > 160) {
        self.view.center = CGPointMake(newX, self.view.center.y);
        
        BaseViewController *masterViewController = (BaseViewController *)self.flipNavigationController.viewControllers[self.flipNavigationController.viewControllers.count-2];
        UIView *masterView = masterViewController.view;
        float step = (_move/320.0)*kSinkSize;
        masterView.frame = CGRectMake(_beginMasterViewX-step, _beginMasterViewX-step, 320-2*_beginMasterViewX+2*step, 460-2*_beginMasterViewX+2*step);
        masterViewController.coverView.alpha = _beginAlpha - (_move/320.0)*kMaxCoverOpacity;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_move > kMinMoveDistance) {
        [self.flipNavigationController popViewControllerAnimated:YES];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.center = CGPointMake(160, 230);
        }];
    }
}

@end
