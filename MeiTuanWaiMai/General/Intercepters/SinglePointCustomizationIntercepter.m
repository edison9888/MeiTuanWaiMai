//
//  SinglePointCustomizationIntercepter.m
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/28/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "SinglePointCustomizationIntercepter.h"
#import "Aspects.h"
#import "ColorMacro.h"
#import <UIKit/UIKit.h>

@interface SinglePointCustomizationIntercepter ()

@end

@implementation SinglePointCustomizationIntercepter

#pragma mark - Public Business Methods

- (void)setupIntercepter
{
    // custom appearance
    [self customAppearanceWithConfiguration:[self customAppearanceConfiguration]];
}

- (void)customAppearanceWithConfiguration:(NSArray*)configuration
{
    [configuration enumerateObjectsUsingBlock:^(NSString *clazzName, NSUInteger idx, BOOL *stop) {
        Class clazz = NSClassFromString(clazzName);

        [clazz aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo){
            UIViewController *controller = aspectInfo.instance;

            // change status bar
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
            // setup navigation bar's properties
            controller.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
            controller.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"btn_backItem"];
            controller.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"btn_backItem"];
            controller.navigationController.navigationBar.tintColor = THEME_COLOR;
            controller.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],
                    NSFontAttributeName : [UIFont systemFontOfSize:20.0f]};
            // change background color
            controller.view.backgroundColor = BACKGROUND_COLOR;

        } error:nil];

        [clazz aspect_hookSelector:@selector(viewWillDisappear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo){
            UIViewController *controller = aspectInfo.instance;

            // change status bar
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
            // change navigation bar's tint color
            controller.navigationController.navigationBar.barTintColor = THEME_COLOR;
        } error:nil];
    }];
}

- (NSArray*)customAppearanceConfiguration
{
    return @[
        @"SwitchLocationViewController"
    ];
}

@end
