//
//  BaseIconItem.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/17.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "BaseIconItem.h"

@implementation BaseIconItem


- (UIView *)sectionView
{
    _sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 10)];
    _sectionView.backgroundColor = kRGBColor(231, 231, 231, 1);
    return _sectionView;
}

@end
