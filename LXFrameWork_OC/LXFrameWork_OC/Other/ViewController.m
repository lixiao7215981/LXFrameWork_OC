//
//  ViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/6/15.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "ViewController.h"
#import "SettingViewController.h"
#import "UIView+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)jupmClick:(UIButton *)sender {
    SettingViewController *setting = [[SettingViewController alloc] init];
    setting.view.frame = self.view.bounds;
    [self.navigationController pushViewController:setting animated:YES];
}


@end
