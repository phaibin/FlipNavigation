//
//  DetailViewController.h
//  FlipNavigation
//
//  Created by Leon on 12-12-18.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface DetailViewController : BaseViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

- (IBAction)backTapped:(id)sender;
- (IBAction)nextTapped:(id)sender;

@end
