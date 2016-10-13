//
//  LXFrameWorkDefine.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 16/10/13.
//  Copyright © 2016年 LXFrameWork. All rights reserved.
//

/*-------- SYSTEM LOG ---------*/
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

/*-------- SYSTEM VERSION ---------*/
//  ==
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
//  >
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
//  >=
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
//  <
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
//  <=
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

/*-------- DEVICE SCREEN ---------*/
#define kWindowWidth      [UIScreen mainScreen].bounds.size.width
#define kWindowHeight     [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH      ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT     ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

/*-------- DEVICE TYPE ---------*/
#define IS_IPAD     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_TV       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomTV)
#define IS_CARPLAY  (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomCarPlay)
#define IS_RETINA   ([[UIScreen mainScreen] scale] >= 2.0)

/*-------- INCHES TYPE ---------*/
#define IS_IPHONE_3_5_INCH (IS_IPHONE && SCREEN_MAX_LENGTH == 480.0)
#define IS_IPHONE_4_0_INCH (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_4_7_INCH (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_5_5_INCH (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define IS_IPHONE_3_5_INCH_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH <= 480.0)
#define IS_IPHONE_4_0_INCH_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH <= 568.0)
#define IS_IPHONE_4_7_INCH_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH <= 667.0)
#define IS_IPHONE_5_5_INCH_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH <= 736.0)

#define IS_IPHONE_3_5_INCH_OR_GREATER (IS_IPHONE && SCREEN_MAX_LENGTH >= 480.0)
#define IS_IPHONE_4_0_INCH_OR_GREATER (IS_IPHONE && SCREEN_MAX_LENGTH >= 568.0)
#define IS_IPHONE_4_7_INCH_OR_GREATER (IS_IPHONE && SCREEN_MAX_LENGTH >= 667.0)
#define IS_IPHONE_5_5_INCH_OR_GREATERE (IS_IPHONE && SCREEN_MAX_LENGTH >= 736.0)

/*-------- NOTIFICATION ---------*/
#define kNotificationCenter [NSNotificationCenter defaultCenter]

/*-------- COLOR ---------*/
//  RandomColor
#define kRandomColor [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0]
//  RGBColor
#define kRGBColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

/*-------- DEFINE CUSTOM ---------*/
//  line WidthOrHeight
#define kLINE_1_PX (1.0f / [UIScreen mainScreen].scale)
//  line BackgroundColor
#define kLINE_Back_Color kRGBColor(221, 221, 221, 1)
//  System Color
#define kSystemColor  kRGBColor(71, 167, 216, 1)
//  AppDelegate
#define MainDelegate  ((BaseDelegate *)[UIApplication sharedApplication].delegate)
// LogFrame
#define kFrameLog(f) NSLog(@"%@",NSStringFromCGRect(f));

#define LXFrameWorkBundle @"LXFrameWork.bundle"
#define BUNDLE_PATH(name) [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: (name)]
#define MYBUNDLE [NSBundle bundleWithPath: BUNDLE_PATH(LXFrameWorkBundle)]



