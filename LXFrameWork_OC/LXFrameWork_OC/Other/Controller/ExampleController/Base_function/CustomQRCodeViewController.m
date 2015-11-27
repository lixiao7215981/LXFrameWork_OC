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


#pragma mark - iOS9 新功能 3D-Touch peek and pop

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"默认" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"选中" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"删除" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    return @[action1,action2,action3];
}

@end
