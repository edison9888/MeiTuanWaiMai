//
//  WaiMaiViewModel.m
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/16/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "WaiMaiViewModel.h"
#import "CurrentAddressClient.h"
#import <ReactiveCocoa.h>

@implementation WaiMaiViewModel

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }

    // Send request to get current address
    [[[[CurrentAddressClient client] locateCurrentAddress] map:^id(RACTuple *JSONAndHeaders) {
        NSDictionary *result = [JSONAndHeaders first];
        return result[@"data"][@"detail"];
    }] subscribeNext:^(NSString* address) {
        self.address= address;
    } error:^(NSError* error) {
        self.address = @"网络连接异常";
    }];

    return self;
}


@end
