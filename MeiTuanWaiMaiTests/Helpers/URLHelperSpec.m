//
//  URLHelperSpec.m
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/16/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "URLHelper.h"


SPEC_BEGIN(URLHelperSpec)

describe(@"URLHelper", ^{

    context(@"when get URL for specifiy resource path - 'v1/city/latlng'", ^{
        it(@"should return correct URL", ^{
            NSString *result = [URLHelper URLWithResourcePath:@"/v1/city/latlng"];
            
            [[result should] equal:[NSString stringWithFormat:@"%@%@", MTWMBaseURL, @"/v1/city/latlng"]];
        });
    });
    
});

SPEC_END
