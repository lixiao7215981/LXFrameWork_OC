//
//  CustomQRCodeViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/11/3.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import "CustomQRCodeViewController.h"
#import "CustomQRCodeTool.h"

@interface CustomQRCodeViewController ()

@end

@implementation CustomQRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"生成二维码"];
    [self createQRCode];
}

- (void) createQRCode
{
    UIImageView *imageV = [UIImageView newAutoLayoutView];
    [self.view addSubview:imageV];
    [imageV autoSetDimensionsToSize:CGSizeMake(250, 250)];
    [imageV autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [imageV autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    imageV.image = [CustomQRCodeTool createQRCodeFromString:@"https://github.com/lixiao7215981" WithSize:250.0f];
    
}


@end
