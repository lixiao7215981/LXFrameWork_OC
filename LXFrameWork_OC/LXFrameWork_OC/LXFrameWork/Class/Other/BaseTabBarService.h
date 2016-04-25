//
//  BaseTabBarService.h
//  LiXiao
//
//  Created by 李晓 on 14/12/22.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseTabBarService : NSObject

/**
 *  StoryBoard -- 往TabBarController 中添加子控制器，并设置对应的TabbarItem 图片和文字
 *
 *  @param storyBoardName    传入StoryBoard 的名称
 *  @param title             tabBarTitle
 *  @param noramlImage       普通状态下的image名称
 *  @param selectedImage     选中状态下image名称
 *
 *  @return 包装好的NavigationController
 */
+ (UINavigationController *) addChildViewWithStoryBoardName:(NSString *) storyBoardName tabBarTitle: (NSString *) title NormalImage:(NSString *)noramlImage SelectedImage:(NSString *) selectedImage;

/**
 *  Xib --往TabBarController 中添加子控制器，并设置对应的TabbarItem 图片和文字
 *
 *  @param xibName          传入 Xib 的名称
 *  @param controllerName   Controller 的名称
 *  @param title            tabBarTitle
 *  @param noramlImage      普通状态下的image名称
 *  @param selectedImage    选中状态下image名称
 *
 *  @return 包装好的NavigationController
 */
+ (UINavigationController *) addChildViewWithXibName:(NSString *) xibName ControllerName:(NSString *)controllerName tabBarTitle: (NSString *) title NormalImage:(NSString *)noramlImage SelectedImage:(NSString *) selectedImage;

@end
