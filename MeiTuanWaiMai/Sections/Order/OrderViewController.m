//
//  OrderViewController.m
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/15/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "OrderViewController.h"
#import "LocationTitleView.h"

@interface OrderViewController()

// UI properties
@property (strong, nonatomic) LocationTitleView* locationTitleView;

@end

@implementation OrderViewController

#pragma mark - Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.tabBarController.navigationItem.titleView = self.locationTitleView;
}

#pragma mark - Custom Accessors
- (LocationTitleView*)locationTitleView
{
    if (!_locationTitleView) {
        _locationTitleView = [[LocationTitleView alloc] initWithFrame:CGRectMake(0, 0, 250, 32)];
        _locationTitleView.locationIconHidden = YES;
        _locationTitleView.locationLabel.text = @"订单";
    }

    return _locationTitleView;
}

@end
