//
//  WaiMaiViewControllerSpec.m
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/16/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "WaiMaiViewController.h"
#import "LocationTitleView.h"

SPEC_BEGIN(WaiMaiViewControllerSpec)

describe(@"WaiMaiViewController", ^{
    __block WaiMaiViewController* controller;

    beforeEach(^{
        controller = [[WaiMaiViewController alloc] init];
        [controller view];
    });

    afterEach(^{
        controller = nil;
    });

    describe(@"LocationLabel", ^{
        __block UILabel *locationLabel;
        
        beforeEach(^{
            locationLabel = controller.locationTitleView.locationLabel;
        });
        
        context(@"when view model's address is 当前位置", ^{
            it(@"should have a text that is equal 当前位置", ^{
                controller.viewModel.address = @"当前位置";
                
                [[locationLabel.text should] equal:@"当前位置"];
            });
        });
    });
});

SPEC_END
