//
//  UIWindow+Extension.m
//  RoyalTeapot
//
//  Created by 李晓 on 15/7/15.
//  Copyright (c) 2015年 RoyalStar. All rights reserved.
//

#import "UIWindow+Extension.h"

@implementation UIWindow (Extension)

+ (UIWindow *) changeWindowRootViewController:(UIViewController *) viewController
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = viewController;
    [window makeKeyWindow];
    MainDelegate.navigationController = (UINavigationController *)viewController;
    return window;
}

+ (UIWindow *)getCurrentWindow
{
    return [[UIApplication sharedApplication].windows lastObject];
}

@end
