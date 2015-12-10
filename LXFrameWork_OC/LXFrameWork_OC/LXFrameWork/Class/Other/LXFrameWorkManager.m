//
//  LXFrameWorkManager.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/12/10.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import "LXFrameWorkManager.h"

@implementation LXFrameWorkManager
LXSingletonM(LXFrameWorkManager);

- (UIColor *)NavigationBar_bgColor
{
    if (_NavigationBar_bgColor == nil) {
        return [UIColor whiteColor];
    }else{
        return _NavigationBar_bgColor;
    }
}

- (UIColor *)ViewController_bgColor
{
    if (_ViewController_bgColor == nil) {
        return [UIColor whiteColor];
    }else{
        return _ViewController_bgColor;
    }
}

- (navBarBackColor)backState
{
    if (_backState == defaultBase || _backState == blackBase) {
        return blackBase;
    }else{
        return writeBase;
    }
}

- (UIColor *)NavigationBar_textColor
{
    if (_NavigationBar_textColor == nil) {
        return [UIColor blackColor];
    }else{
        return _NavigationBar_textColor;
    }
}



@end
