//
//  CurrentAddressClient.h
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/15/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;

@interface CurrentAddressClient : NSObject

+ (RACSignal *)locateCurrentAddress;

@end
