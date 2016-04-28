//
//  LocalAuthenticationViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/12/18.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import "LocalAuthenticationViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface LocalAuthenticationViewController ()
{
    NSTimer *_timer;
    UIView *_titleView;
    UILabel *_label;
    NSInteger _timerValue;
}

@property (nonatomic,assign) BOOL isAuthent;
@end

@implementation LocalAuthenticationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"指纹识别验证"];
    __weak typeof(self) weekSelf = self;
    
    [self setRightBtnWithImage:nil orTitle:@"Again" Font:[UIFont systemFontOfSize:15] ClickOption:^{
        if (weekSelf.isAuthent)return ;
        [weekSelf addAuthentView];
    }];
    
    [self addAuthentView];
}

-  (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_timer invalidate];
    [_titleView removeFromSuperview];
}

- (void) addAuthentView
{
    _isAuthent = YES;
    UIView *titleView = [UIView newAutoLayoutView];
    [self.view addSubview:titleView];
    titleView.backgroundColor = [UIColor lightGrayColor];
    _titleView = titleView;
    titleView.layer.cornerRadius = 5;
    titleView.layer.masksToBounds = YES;
    [titleView autoSetDimensionsToSize:CGSizeMake(300, 150)];
    [titleView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [titleView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.view withOffset:-100];
    
    UILabel *label = [UILabel newAutoLayoutView];
    label.font = [UIFont systemFontOfSize:25];
    label.textColor = [UIColor redColor];
    [titleView addSubview:label];
    _label = label;
    [label autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [label autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    UILabel *title = [UILabel newAutoLayoutView];
    [titleView addSubview:title];
    [title autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [title autoAlignAxis:ALAxisHorizontal toSameAxisOfView:label withOffset:-50];
    title.text = @"准备好您的手指进行指纹验证";
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer:) userInfo:@"hello timer" repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    _timerValue = 5;
    _label.text = [NSString stringWithFormat:@"%ld",_timerValue];
}

- (void) updateTimer:(NSTimer *) params
{
    if (_timerValue <= 0) {
        [self startAuthenticationContext];
        [_timer invalidate];
    }else{
        _timerValue --;
        _label.text = [NSString stringWithFormat:@"%ld",_timerValue];
    }
}

- (void) startAuthenticationContext
{
    LAContext *authenticationContext = [[LAContext alloc] init];
    NSError *error = [[NSError alloc] init];
    BOOL isTouchIdAvailable = [authenticationContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
    if (isTouchIdAvailable) {
        [authenticationContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"要验证您的指纹来确定您的身份" reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [_titleView removeFromSuperview];
                    self.isAuthent = NO;
                    [[[UIAlertView alloc] initWithTitle:@"提示" message:@"主人！主人！就是你！" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil]show];
                });
            }else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [_titleView removeFromSuperview];
                    self.isAuthent = NO;
                    [[[UIAlertView alloc] initWithTitle:@"提示" message:@"呀！失败了，擦擦！" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
                });
            }
        }];
    }else{
        self.isAuthent = NO;
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"您的指纹识别不可用" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil]show];
    }
}

@end
