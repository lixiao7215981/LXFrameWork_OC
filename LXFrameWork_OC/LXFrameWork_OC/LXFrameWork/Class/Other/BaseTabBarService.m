//
//  BaseTabBarService.m
//  LiXiao
//
//  Created by 李晓 on 14/12/22.
//  Copyright (c) 2014年 All rights reserved.
//

#import "BaseTabBarService.h"
#import "BaseNavigationController.h"

@implementation BaseTabBarService

+ (UINavigationController *) addChildViewWithStoryBoardName:(NSString *) storyBoardName tabBarTitle: (NSString *) title NormalImage:(NSString *)noramlImage SelectedImage:(NSString *) selectedImage;
{
    UIViewController *controller = [[UIStoryboard storyboardWithName:storyBoardName bundle:nil] instantiateInitialViewController];
    controller.title = title;
    // 设置默认图标和选中时候的图标
    UIImage *nomimage = [UIImage imageNamed:noramlImage];
    UIImage *selImage = [UIImage imageNamed:selectedImage];
    [controller.tabBarItem setSelectedImage:[selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    controller.tabBarItem.image = [nomimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置字体普通和选中模式下的颜色
    NSMutableDictionary *normalDict =  [NSMutableDictionary dictionary];
    normalDict[NSForegroundColorAttributeName] = [UIColor grayColor];
    normalDict[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [controller.tabBarItem setTitleTextAttributes:normalDict forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedDict =  [NSMutableDictionary dictionary];
    selectedDict[NSForegroundColorAttributeName] = [UIColor redColor];
    [controller.tabBarItem setTitleTextAttributes:selectedDict forState:UIControlStateSelected];
    
    if (![controller isKindOfClass:[UINavigationController class]]) {
        BaseNavigationController *navigationVC = [[BaseNavigationController alloc] initWithRootViewController:controller];
        return navigationVC;
    }
    
    return controller;
}

+ (UINavigationController *) addChildViewWithXibName:(NSString *) xibName ControllerName:(NSString *)controllerName tabBarTitle: (NSString *) title NormalImage:(NSString *)noramlImage SelectedImage:(NSString *) selectedImage;
{
    UIViewController *controller = nil;
    if (xibName.length) {
        controller = [[NSClassFromString(controllerName) alloc]initWithNibName:xibName bundle:nil];
    }else{
        controller = [[NSClassFromString(controllerName) alloc]init];
    }
    controller.title = title;
    // 设置默认图标和选中时候的图标
    UIImage *nomimage = [UIImage imageNamed:noramlImage];
    UIImage *selImage = [UIImage imageNamed:selectedImage];
    [controller.tabBarItem setSelectedImage:[selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    controller.tabBarItem.image = [nomimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置字体普通和选中模式下的颜色
    NSMutableDictionary *normalDict =  [NSMutableDictionary dictionary];
    normalDict[NSForegroundColorAttributeName] = [UIColor grayColor];
    normalDict[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [controller.tabBarItem setTitleTextAttributes:normalDict forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedDict =  [NSMutableDictionary dictionary];
    selectedDict[NSForegroundColorAttributeName] = [UIColor redColor];
    [controller.tabBarItem setTitleTextAttributes:selectedDict forState:UIControlStateSelected];
    
    if (![controller isKindOfClass:[UINavigationController class]]) {
        BaseNavigationController *navigationVC = [[BaseNavigationController alloc] initWithRootViewController:controller];
        return navigationVC;
    }
    return controller;
}

@end
