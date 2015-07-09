//
//  NavigationBar.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/8.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "NavigationBar.h"

@implementation NavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        // 设置背景View
        _backView = [UIView newAutoLayoutView];
        _backView.backgroundColor = _backViewBackColor = [UIColor whiteColor];
        [self addSubview:_backView];
        [_backView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        // 设置按钮View
        _btnView = [UIView newAutoLayoutView];
        _btnView.backgroundColor = [UIColor clearColor];
        [self addSubview:_btnView];
        [_btnView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(20, 0, 0, 0)];
        
        // 设置底部线
        _lineView = [UIView newAutoLayoutView];
        _lineView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
        [self addSubview:_lineView];
        [_lineView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [_lineView autoSetDimension:ALDimensionHeight toSize:0.5];
    }
    return self;
}

- (void)setLeftView:(UIView *)leftView
{
    [_leftView removeFromSuperview];
    _leftView = leftView;
    CGRect rect = leftView.frame;
    leftView.frame = CGRectZero;
    [_btnView addSubview:leftView];
    leftView.translatesAutoresizingMaskIntoConstraints = NO;
    [leftView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [leftView autoSetDimensionsToSize:CGSizeMake(rect.size.width == 0 ? 50 : rect.size.width, 44)];
    [leftView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset: 0];
}

- (void)setRightView:(UIView *)rightView
{
    [_rightView removeFromSuperview];
    _rightView = rightView;
    CGRect rect = rightView.frame;
    rightView.frame = CGRectZero;
    [_btnView addSubview:rightView];
    rightView.translatesAutoresizingMaskIntoConstraints = NO;
    [rightView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [rightView autoSetDimensionsToSize:CGSizeMake(rect.size.width == 0 ? 50 : rect.size.width, 44)];
    [rightView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
}

- (void) setCenterView:(UIView *)centerView
{
    [_centerView removeFromSuperview];
    _centerView = centerView;
    CGRect rect = centerView.frame;
    centerView.frame = CGRectZero;
    [_btnView addSubview:centerView];
    [centerView autoAlignAxisToSuperviewMarginAxis:ALAxisHorizontal];
    [centerView autoAlignAxisToSuperviewMarginAxis:ALAxisVertical];
    [centerView autoSetDimensionsToSize:CGSizeMake(rect.size.width == 0 ?200 :rect.size.width, 44)];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    _backViewBackColor = backgroundColor;
    _backView.backgroundColor = backgroundColor;
}

- (void) setScrollNavigationBarBackColor:(UIColor *) color
{
    _backView.backgroundColor = color;
}

- (void)setScrollNavigationBarLineBackColor:(UIColor *)color
{
    _lineView.backgroundColor = color;
}

@end
