//
//  AppDelegate.m
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/15/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "AppDelegate.h"
#import "WaiMaiViewController.h"
#import "OrderViewController.h"
#import "MeViewController.h"
#import "ColorMacro.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{

    // increase launch image time
    sleep(1);

    // iniitalize and setup window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    self.window.rootViewController = [self rootViewController];
    
    // customize navigation bar
    [UINavigationBar appearance].barTintColor = THEME_COLOR;
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].titleTextAttributes = @{ NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:20] };

    return YES;
}

- (void)applicationWillResignActive:(UIApplication*)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication*)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication*)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication*)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication*)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Helper methods
- (UITabBarController*)rootViewController
{
    UITabBarController* tabBarController = [[UITabBarController alloc] init];

    WaiMaiViewController* waiMaiViewController = [[WaiMaiViewController alloc] init];
    OrderViewController* orderViewController = [[OrderViewController alloc] init];
    MeViewController* meViewController = [[MeViewController alloc] init];

    NSArray* subControllers = @[ waiMaiViewController, orderViewController, meViewController ];
    NSMutableArray* tabSubControllers = [[NSMutableArray alloc] init];

    NSArray* titles = @[ @"外卖", @"订单", @"我的" ];
    NSArray* tabImageNames = @[ @"icon_tabbar_home", @"icon_tabbar_order", @"icon_tabbar_mine" ];
    NSArray* tabSelectedImageNames = @[ @"icon_tabbar_home_selected", @"icon_tabbar_order_selected", @"icon_tabbar_mine_selected" ];

    [subControllers enumerateObjectsUsingBlock:^(UIViewController* controller, NSUInteger idx, BOOL* stop) {
        UITabBarItem* tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[idx] image:[UIImage imageNamed:tabImageNames[idx]] selectedImage:[UIImage imageNamed:tabSelectedImageNames[idx]]];
        controller.tabBarItem = tabBarItem;
        UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
        [tabSubControllers addObject:navigationController];
    }];
    tabBarController.viewControllers = tabSubControllers;

    // Setup tab bar's tint color
    [[UITabBar appearance] setTintColor:THEME_COLOR];

    return tabBarController;
}

@end
