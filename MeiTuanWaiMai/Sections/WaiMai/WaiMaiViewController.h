//
//  WaiMaiViewController.h
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/15/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationTitleView.h"
#import "WaiMaiViewModel.h"

@interface WaiMaiViewController : UIViewController

// UI properties
@property (strong, nonatomic, readonly) LocationTitleView* locationTitleView;
// View Model
@property (strong, nonatomic, readonly) WaiMaiViewModel *viewModel;

@end
