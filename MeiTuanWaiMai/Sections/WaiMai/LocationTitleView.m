//
//  LocationTitleView.m
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/15/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "LocationTitleView.h"
#import <UIKit/UIKit.h>
#import <Masonry.h>

@interface LocationTitleView()

@property (strong, nonatomic) UIImageView *currentAddressImageView;
@property (strong, nonatomic) UIImageView *backItemImageView;

@end

@implementation LocationTitleView

#pragma mark - Views hierarchy and layout

- (void)addSubviews
{
    [self addSubview:self.locationLabel];
    [self addSubview:self.currentAddressImageView];
    [self addSubview:self.backItemImageView];
}

- (void)defineLayout
{
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];

    [self.currentAddressImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.locationLabel.mas_left).offset(-5.0);
    }];

    [self.backItemImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.locationLabel.mas_right).with.offset(5.0);
    }];
}

#pragma mark - Views Lazy Initialization

- (UILabel *)locationLabel
{
    if (!_locationLabel) {
        _locationLabel = [UILabel new];
        _locationLabel.text = @"";
        _locationLabel.font = [UIFont systemFontOfSize:20.0f];
        _locationLabel.textColor = [UIColor whiteColor];
    }

    return _locationLabel;
}

- (UIImageView *)currentAddressImageView
{
    if (!_currentAddressImageView) {
        _currentAddressImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_my_address"]];
    }

    return _currentAddressImageView;
}

- (UIImageView *)backItemImageView
{
    if (!_backItemImageView) {
        _backItemImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_arrow_white"]];
    }
    return _backItemImageView;
}


@end
