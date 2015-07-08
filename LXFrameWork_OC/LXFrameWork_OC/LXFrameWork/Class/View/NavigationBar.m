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
        _centerView = [[UIView alloc] initWithFrame:frame];
        _centerView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_centerView];
        _btnView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, frame.size.width, frame.size.height - 20)];
        _btnView.backgroundColor = [UIColor clearColor];
        [self addSubview:_btnView];
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
    [centerView autoSetDimensionsToSize:CGSizeMake(rect.size.width == 0 ?150 :rect.size.width, 44)];
}

@end
