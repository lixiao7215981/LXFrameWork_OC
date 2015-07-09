//
//  BaseViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

#define BaseNavBarTextFont [UIFont systemFontOfSize:16]

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 添加自定义的NavigationBar
    [self.navigationController.navigationBar removeFromSuperview];
    [self.view addSubview:self.navView];
    if (!self.view.backgroundColor) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    //    self.navView.backgroundColor = [UIColor redColor];
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
    UIButton *button = [[UIButton alloc] init];
    __weak typeof(self) baseView  = self;
    [self setLeftView:^UIView *{
        [button setImage:[UIImage imageNamed:@"navigationbar_back"] forState:UIControlStateNormal];
        [button addTarget:baseView action:@selector(NavBackBtnClick) forControlEvents:UIControlEventTouchUpInside];
        return button;
    }];
    return button;
}

- (UILabel *)setTitle:(NSString *)title
{
    UILabel *centerTitle = [[UILabel alloc] init];
    centerTitle.textAlignment = NSTextAlignmentCenter;
    centerTitle.font = BaseNavBarTextFont;
    centerTitle.textColor = [UIColor blackColor];
    centerTitle.text = title;
    [self setCenterView:^UIView *{
        return centerTitle;
    }];
    return centerTitle;
}

- (UIButton *)setLeftBtnWithImage:(UIImage *)image orTitle:(NSString *)title ClickOption:(ClickButton)clickOption
{
    BlockButton *button = [[BlockButton alloc] init];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = BaseNavBarTextFont;
    __weak typeof(self) baseView  = self;
    [self setLeftView:^UIView *{
        if (image) {
            [button setImage:image forState:UIControlStateNormal];
        }
        if (title.length) {
            [button setTitle:title forState:UIControlStateNormal];
        }
        button.ClickOption = clickOption;
        [button addTarget:baseView action:@selector(clickBtnOption:) forControlEvents:UIControlEventTouchUpInside];
        return button;
    }];
    return button;
}

- (UIButton *)setRightBtnWithImage:(UIImage *)image orTitle:(NSString *)title ClickOption:(ClickButton) clickOption
{
    BlockButton *button = [[BlockButton alloc] init];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = BaseNavBarTextFont;
    __weak typeof(self) baseView  = self;
    [self setRightView:^UIView *{
        if (image) {
            [button setImage:image forState:UIControlStateNormal];
        }
        if (title.length) {
            [button setTitle:title forState:UIControlStateNormal];
        }
        button.ClickOption = clickOption;
        [button addTarget:baseView action:@selector(clickBtnOption:) forControlEvents:UIControlEventTouchUpInside];
        return button;
    }];
    return button;
}

#pragma  mark - 按钮点击

- (void)NavBackBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickBtnOption:(BlockButton *) btn
{
    if (btn.ClickOption) {
        btn.ClickOption();
    }
}

#pragma mark - 懒加载
- (NavigationBar *)navView
{
    if (!_navView) {
        _navView = [[NavigationBar alloc] init];
        _navView = [[NavigationBar alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 64)];
    }
    return _navView;
}

@end
