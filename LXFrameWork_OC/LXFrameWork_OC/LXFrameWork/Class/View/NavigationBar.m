//
//  NavigationBar.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/8.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "NavigationBar.h"
#import "LXFrameWorkManager.h"
#import "LXFrameWorkDefine.h"
#import <PureLayout.h>

// NavBar最下边 Line 的颜色
#define lineView_BackageGroundColor [[UIColor lightGrayColor] colorWithAlphaComponent:0.5]

@interface NavigationBar()
{
    NSLayoutConstraint *_btnViewEdgesTop;
}
@end

@implementation NavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        LXFrameWorkManager *manager = [LXFrameWorkManager sharedLXFrameWorkManager];
        if (manager.navigationBar_bgImage) {
            // 设置 NavBar 背景图片
            [_backImageView removeFromSuperview];
            _backImageView = [UIImageView newAutoLayoutView];
            _backImageView.image = manager.navigationBar_bgImage;
            [self addSubview:_backImageView];
            [_backImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        }else{
            // 设置 NavBar 背景颜色
            self.backgroundColor = _BackColor = manager.navigationBar_bgColor;
        }
        // 设置Button View
        _btnView = [UIView newAutoLayoutView];
        _btnView.backgroundColor = [UIColor clearColor];
        [self addSubview:_btnView];
        NSArray * array = [_btnView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(kStatusBarHeight, 0, 0, 0)];
        _btnViewEdgesTop = [array firstObject];
        
        // 设置底部线
        _lineView = [UIView newAutoLayoutView];
        _lineView.backgroundColor = lineView_BackageGroundColor;
        [self addSubview:_lineView];
        [_lineView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [_lineView autoSetDimension:ALDimensionHeight toSize:0.5];
        
        // 设置底部阴影
        self.layer.shadowColor = [[UIColor blackColor]CGColor];
        self.layer.shadowOpacity = 0.15;
        self.layer.shadowOffset = CGSizeMake(0, 0.1);
        // self.clipsToBounds = YES;
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
    //    leftView.backgroundColor = [UIColor redColor];
    //    NSLog(@"leftViewRect = %@",NSStringFromCGRect(rect));
    [leftView autoSetDimensionsToSize:CGSizeMake(rect.size.width == 0 ? 40 : rect.size.width + 26, rect.size.height == 0 ? (_btnViewEdgesTop.constant == 0 ? 32 : 44) : rect.size.height)];
    [leftView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
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
    //    rightView.backgroundColor = [UIColor blueColor];
    //    NSLog(@"rightViewRect = %@",NSStringFromCGRect(rect));
    [rightView autoSetDimensionsToSize:CGSizeMake(rect.size.width == 0 ? 40 : rect.size.width + 26, rect.size.height == 0 ? (_btnViewEdgesTop.constant == 0 ? 32 : 44) : rect.size.height)];
    [rightView autoPinEdgeToSuperviewEdge:ALEdgeRight];
}

- (void) setCenterView:(UIView *)centerView
{
    [_centerView removeFromSuperview];
    _centerView = centerView;
    CGRect rect = centerView.frame;
    centerView.frame = CGRectZero;
    [_btnView addSubview:centerView];
    [centerView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [centerView autoAlignAxisToSuperviewAxis:ALAxisVertical];
//        centerView.backgroundColor = [UIColor yellowColor];
    //    NSLog(@"centerViewRect = %@",NSStringFromCGRect(rect));
    [centerView autoSetDimensionsToSize:CGSizeMake(rect.size.width == 0 ? (_btnViewEdgesTop.constant == 0 ? 500 : 200) :rect.size.width, rect.size.height == 0 ? (_btnViewEdgesTop.constant == 0 ? 32 : 44) : rect.size.height)];
}

- (void) setScrollNavigationBarBackColor:(UIColor *) color
{
    self.backgroundColor = color;
}

- (void) setScrollNavigationBarLineBackColor:(UIColor *)color
{
    _lineView.backgroundColor = color;
}

- (void) setScrollNavigationBarBackImageAlpha:(CGFloat)alpha
{
    self.backImageView.alpha = alpha;
}

- (void) setNavigationBarHiddenShowBtn:(BOOL)isHidden
{
    if (isHidden) {
        [self setScrollNavigationBarBackColor:[UIColor clearColor]];
        [self setScrollNavigationBarLineBackColor: [UIColor clearColor]];
    }else{
        [self setScrollNavigationBarBackColor:_BackColor];
        [self setScrollNavigationBarLineBackColor: lineView_BackageGroundColor];
    }
}

- (void) setNavBarInterfaceOrientation:(NavBarInterface)interface
{
    if (interface == PortraitUpsideDown) {
        _btnViewEdgesTop.constant = kStatusBarHeight;
    }else if(interface == LeftRight){
        _btnViewEdgesTop.constant = 0;
    }
}


@end
