//
//  BaseViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "BaseViewController.h"
#import "NavigationBar.h"
@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar removeFromSuperview];
    
    _navView = [[NavigationBar alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 64)];
    [self.view insertSubview:_navView atIndex:0];
    
    
    [self setLeftBtnWithImage:nil orTitle:@"左边" ClickOption:^() {
        NSLog(@"点击了左边按钮");
    }];
    
    [self setRightBtnWithImage:nil orTitle:@"右边" ClickOption:^() {
        NSLog(@"点击了右边按钮");
    }];
    [self setTitle:@"我爱洗澡皮肤好好"];
    
}

- (void)setLeftView:(ViewBlock)leftViewBlock
{
    UIView *leftView = leftViewBlock();
    _navView.leftView = leftView;
}

- (void)setRightView:(ViewBlock)rightViewBlock
{
    UIView *rightView = rightViewBlock();
    _navView.rightView = rightView;
}

- (void)setCenterView:(ViewBlock)centerViewBlock
{
    UIView *centerView = centerViewBlock();
    _navView.centerView = centerView;
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
    centerTitle.font = [UIFont systemFontOfSize:17];
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

@end
