//
//  NavigationBar.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/8.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PureLayout.h"

@interface NavigationBar : UIView

/**
 *  背景View 添加在NavigationBar做背景View
 */
@property (nonatomic,strong) UIView *backView;
/**
 *  left,right,center 所在View
 */
@property (nonatomic,strong) UIView *btnView;
/**
 *  NavBar 左边View
 */
@property (nonatomic,strong) UIView *leftView;
/**
 *  NavBar 中间边View
 */
@property (nonatomic,strong) UIView *centerView;
/**
 *  NavBar 右边View
 */
@property (nonatomic,strong) UIView *rightView;


- (void) setNavigationBarBackColor:(UIColor *) color;


@end
