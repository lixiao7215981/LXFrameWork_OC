//
//  BaseViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (nonatomic, strong) IQKeyboardReturnKeyHandler *returnKeyHandler;
@end

@implementation BaseViewController

#define BaseNavBarTextFont [UIFont systemFontOfSize:17]

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 添加自定义的NavigationBar
    [self.navigationController.navigationBar removeFromSuperview];
    [self.view addSubview:self.navView];
    [self.navView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
    [self.navView autoSetDimension:ALDimensionHeight toSize:64];
    if (!self.view.backgroundColor) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    // 设置键盘toolbar样式
    self.returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
    self.returnKeyHandler.lastTextFieldReturnKeyType = UIReturnKeyDone;
    
}

- (void)dealloc
{
    self.returnKeyHandler = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view bringSubviewToFront:self.navView];
}

- (void)setLeftView:(ViewBlock)leftViewBlock
{
    UIView *leftView = leftViewBlock();
    self.navView.leftView = leftView;
}

- (void)setRightView:(ViewBlock)rightViewBlock
{
    UIView *rightView = rightViewBlock();
    self.navView.rightView = rightView;
}

- (void)setCenterView:(ViewBlock)centerViewBlock
{
    UIView *centerView = centerViewBlock();
    self.navView.centerView = centerView;
}

- (UIButton *)setBackBtn
{
    UIButton *button = [UIButton newAutoLayoutView];
    __weak typeof(self) baseView  = self;
    [self setLeftView:^UIView *{
        LXFrameWorkInstance *instance = [LXFrameWorkInstance sharedLXFrameWorkInstance];
        if (instance.backState == writeBase) {
            [button setImage:[BundleTool getImage:@"Navigationbar_back_write" FromBundle:LXFrameWorkBundle] forState:UIControlStateNormal];
        }else if(instance.backState == blackBase){
            [button setImage:[BundleTool getImage:@"navigationbar_back" FromBundle:LXFrameWorkBundle] forState:UIControlStateNormal];
        }
        [button addTarget:baseView action:@selector(NavBackBtnClick) forControlEvents:UIControlEventTouchUpInside];
        return button;
    }];
    return button;
}

- (UILabel *)setNavTitle:(NSString *)title
{
    LXFrameWorkInstance *instance = [LXFrameWorkInstance sharedLXFrameWorkInstance];
    UILabel *centerTitle = [UILabel newAutoLayoutView];
    centerTitle.textAlignment = NSTextAlignmentCenter;
    centerTitle.font = BaseNavBarTextFont;
    centerTitle.textColor = instance.NavigationBar_textColor;
    centerTitle.text = title;
    [self setCenterView:^UIView *{
        return centerTitle;
    }];
    return centerTitle;
}

- (UIButton *)setLeftBtnWithImage:(UIImage *)image orTitle:(NSString *)title ClickOption:(ClickButton)clickOption
{
    LXFrameWorkInstance *instance = [LXFrameWorkInstance sharedLXFrameWorkInstance];
    BlockButton *button = [BlockButton newAutoLayoutView];
    button.titleLabel.font = BaseNavBarTextFont;
    [self setLeftView:^UIView *{
        if (image) {
            [button setImage:image forState:UIControlStateNormal];
        }
        if (title.length) {
            [button setTitle:title forState:UIControlStateNormal];
            [button setTitleColor:instance.NavigationBar_textColor forState:UIControlStateNormal];
        }
        button.ClickOption = clickOption;
        return button;
    }];
    return button;
}

- (UIButton *)setRightBtnWithImage:(UIImage *)image orTitle:(NSString *)title ClickOption:(ClickButton) clickOption
{
    LXFrameWorkInstance *instance = [LXFrameWorkInstance sharedLXFrameWorkInstance];
    BlockButton *button = [[BlockButton alloc] init];
    button.titleLabel.font = BaseNavBarTextFont;
    [self setRightView:^UIView *{
        if (image) {
            [button setImage:image forState:UIControlStateNormal];
        }
        if (title.length) {
            [button setTitle:title forState:UIControlStateNormal];
            [button setTitleColor:instance.NavigationBar_textColor forState:UIControlStateNormal];
        }
        button.ClickOption = clickOption;
        return button;
    }];
    return button;
}

#pragma  mark - 按钮点击

- (void)NavBackBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 懒加载
- (NavigationBar *)navView
{
    if (!_navView) {
        _navView = [NavigationBar newAutoLayoutView];
    }
    return _navView;
}

@end
