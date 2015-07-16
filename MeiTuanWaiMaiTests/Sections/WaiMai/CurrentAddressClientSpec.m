//
//  CurrentAddressClientSpec.m
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/16/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "CurrentAddressClient.h"
#import <ReactiveCocoa.h>

SPEC_BEGIN(CurrentAddressClientSpec)

describe(@"CurrentAddressClient", ^{
    
    __block BOOL success;
    __block NSError *error;
    
    beforeEach(^{
        success = NO;
        error = nil;
    });

    context(@"when get current address ", ^{
        it(@"shoule not be nil", ^{
            RACSignal *signal = [[CurrentAddressClient client] locateCurrentAddress];
            
            RACTuple *tuple = [signal asynchronousFirstOrDefault:nil success:&success error:&error];
            NSDictionary *data = tuple.first[@"data"];
            
            [[theValue(success) should] beYes];
            [[data shouldNot] beNil];
        });
    });
});

SPEC_END
