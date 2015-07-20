//
//  ColorMacro.h
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/15/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#ifndef MeiTuanWaiMai_ColorMacro_h
#define MeiTuanWaiMai_ColorMacro_h


// UIColor Helper Macro
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

// App Colors
#define THEME_COLOR UIColorFromRGB(0xFB4F44)
#define BACKGROUND_COLOR UIColorFromRGB(0xF6F6F6)

#endif
