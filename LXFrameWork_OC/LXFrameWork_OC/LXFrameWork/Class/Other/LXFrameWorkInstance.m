//
//  LXFrameWorkInstance.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/8/21.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "LXFrameWorkInstance.h"

@implementation LXFrameWorkInstance
LXSingletonM(LXFrameWorkInstance);


- (UIColor *)NavigationBar_bgColor
{
    if (_NavigationBar_bgColor == nil) {
        return [UIColor whiteColor];
    }else{
        return _NavigationBar_bgColor;
    }
}


- (navBarBackColor)backState
{
    if (_backState) {
        return _backState;
    }else{
        return writeBase;
    }
}



@end
