//
//  WaiMaiViewController.m
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/15/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "WaiMaiViewController.h"
#import "LocationTitleView.h"
#import "CurrentAddressClient.h"
#import <ReactiveCocoa.h>

@interface WaiMaiViewController ()

@property (strong, nonatomic) LocationTitleView* locationTitleView;

@end

@implementation WaiMaiViewController

#pragma mark - Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Setup navigation item's title view
    self.navigationItem.titleView = self.locationTitleView;

    // Send request to get current address and update UI
    [[[CurrentAddressClient locateCurrentAddress] map:^id(NSDictionary* result) {
        return result[@"data"][@"detail"];
    }] subscribeNext:^(NSString* address) {
        self.locationTitleView.locationLabel.text = address;
    }];

    // handle event when click title view
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.locationTitleView addGestureRecognizer:tapGestureRecognizer];
    [[tapGestureRecognizer rac_gestureSignal] subscribeNext:^(id x) {

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

@end
