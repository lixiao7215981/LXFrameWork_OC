//
//  XibCreateViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/9.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "XibCreateViewController.h"

@interface XibCreateViewController ()

@end

@implementation XibCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Xib 创建ViewController"];
    UIView *readView = [[UIView alloc] initWithFrame:CGRectMake(0 ,0 , 100, 100)];
    readView.backgroundColor = [UIColor redColor];
    [self.view addSubview:readView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
