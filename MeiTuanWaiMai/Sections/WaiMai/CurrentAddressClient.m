//
//  CurrentAddressClient.m
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/15/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "CurrentAddressClient.h"
#import <ReactiveCocoa.h>
#import <AFNetworking.h>

@implementation CurrentAddressClient

+ (RACSignal *)locateCurrentAddress
{
    RACSubject *signal = [RACSubject subject];

    [[AFHTTPSessionManager manager] GET:@"http://localhost:12306/v1/city/latlng" parameters:@"" success:^(NSURLSessionDataTask *task, id responseObject) {
        [signal sendNext:responseObject];
        [signal sendCompleted];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Network error: %@", error);
        [signal sendError:error];
    }];

    return [[signal logError] catchTo:[RACSignal empty]];
}


@end
