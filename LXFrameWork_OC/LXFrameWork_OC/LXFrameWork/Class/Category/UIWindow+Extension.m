//
//  UIWindow+Extension.m
//  RoyalTeapot
//
//  Created by 李晓 on 15/7/15.
//  Copyright (c) 2015年 RoyalStar. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "BaseDelegate.h"
#define KBaseDelegate  ((BaseDelegate *)[UIApplication sharedApplication].delegate)
@implementation UIWindow (Extension)

+ (UIWindow *) changeWindowRootViewController:(UIViewController *) viewController animated:(BOOL)animated
{
    UIWindow *window = KBaseDelegate.window;
    if (animated) {
        [UIView transitionFromView:window.rootViewController.view toView:viewController.view duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            window.rootViewController = viewController;
            [window makeKeyAndVisible];
            [self setBaseDelegateNavigationController:viewController];
        }];
    }else{
        window.rootViewController = viewController;
        [window makeKeyAndVisible];
        [self setBaseDelegateNavigationController:viewController];
    }
    return window;
}

+ (void)setBaseDelegateNavigationController:(UIViewController *) controller
{
    if ([controller isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tbController = (UITabBarController *)controller;
        KBaseDelegate.navigationController = (UINavigationController *)[tbController.viewControllers firstObject];
    }else if([controller isKindOfClass:[UINavigationController class]]){
        KBaseDelegate.navigationController = (UINavigationController *)controller;
    }
}

+ (UIWindow *)getCurrentWindow
{
    return [[UIApplication sharedApplication].windows lastObject];
}

@end
