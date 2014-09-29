//
//  ViewController.m
//  MobileDataSwich
//
//  Created by ly on 9/29/14.
//  Copyright (c) 2014 ly. All rights reserved.
//

#import "ViewController.h"

extern BOOL CTCellularDataPlanGetIsEnabled();
extern void CTCellularDataPlanSetIsEnabled(BOOL enabled);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    BOOL enabled = [self refreshMobileDataState];
    self.mobileDataSwith.on = enabled;
}

#pragma mark - IBAction
- (IBAction)setMobileDataEnabled:(BOOL)enabled
{
    CTCellularDataPlanSetIsEnabled(enabled);
    [self refreshMobileDataState];
}

- (BOOL)refreshMobileDataState
{
    BOOL enabled = self.mobileDataSwith.on;
    NSString *tips = [NSString stringWithFormat:@"Mobile data enabled: %@", enabled ? @"YES":@"NO"];
    self.tipsLabel.text = tips;
    
    return enabled;
}

@end
