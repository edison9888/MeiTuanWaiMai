//
//  CurrentAddressClient.m
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/15/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "CurrentAddressClient.h"
#import "URLHelper.h"
#import <ReactiveCocoa.h>
#import <AFNetworking.h>
#import <RACAFNetworking.h>

@implementation CurrentAddressClient

+ (instancetype)client
{
    return [[[self class] alloc] init];
}

- (RACSignal *)locateCurrentAddress
{
    return [[[AFHTTPSessionManager manager] rac_GET:
            [URLHelper URLWithResourcePath:@"/v1/city/latlng"] parameters:nil] replayLazily] ;
}


@end
