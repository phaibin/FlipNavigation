//
//  DetailViewController.m
//  FlipNavigation
//
//  Created by Leon on 12-12-18.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController
{
    CGPoint _beginPoint;
    float _beginX;
    float _beginMasterViewX;
    float _beginAlpha;
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.view.layer.shadowOpacity = 0.5;
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
							
- (IBAction)backTapped:(id)sender {
    [self.flipNavigationController popViewControllerAnimated:YES];
}

- (IBAction)nextTapped:(id)sender {
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    [self.flipNavigationController pushViewController:detailViewController animated:YES];
}

@end
