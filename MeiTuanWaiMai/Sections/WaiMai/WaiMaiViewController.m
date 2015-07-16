//
//  WaiMaiViewController.m
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/15/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "WaiMaiViewController.h"
#import <ReactiveCocoa.h>

@interface WaiMaiViewController ()

// UI properties
@property (strong, nonatomic) LocationTitleView* locationTitleView;
// View Model
@property (strong, nonatomic) WaiMaiViewModel *viewModel;

@end

@implementation WaiMaiViewController

#pragma mark - Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Setup navigation item's title view
    self.navigationItem.titleView = self.locationTitleView;

    // bind data
    RAC(self.locationTitleView.locationLabel, text) = RACObserve(self.viewModel, address);

    // handle event when click title view
    UITapGestureRecognizer* tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.locationTitleView addGestureRecognizer:tapGestureRecognizer];
    [[tapGestureRecognizer rac_gestureSignal] subscribeNext:^(id x){

    }];
}

#pragma mark - Custom Accessors
- (LocationTitleView*)locationTitleView
{
    if (!_locationTitleView) {
        _locationTitleView = [[LocationTitleView alloc] initWithFrame:CGRectMake(0, 0, 250, 32)];
    }

    return _locationTitleView;
}

- (WaiMaiViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [WaiMaiViewModel new];
    }

    return _viewModel;
}

@end
