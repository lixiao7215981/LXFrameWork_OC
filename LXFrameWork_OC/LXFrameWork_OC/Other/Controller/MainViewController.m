//
//  MainViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/9.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "MainViewController.h"
#import "XibCreateViewController.h"
#import "XibCreateTableViewController.h"
#import "CodeCreateViewController.h"
#import "CodeCreateTableViewController.h"
#import "CodeCreatePullTableViewController.h"
#import "SystemDebugTableViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [self setNavTitle:@"测试各种环境环境环境环境"];
    label.textColor = [UIColor redColor];
    
    __weak typeof(self) nav = self;
    [self setRightBtnWithImage:nil orTitle:@"调试" ClickOption:^{
        SystemDebugTableViewController *debug = [[SystemDebugTableViewController alloc] init];
        [nav.navigationController pushViewController:debug animated:YES];
    }];
}

- (IBAction)XibCreateView:(UIButton *)sender {
    
    XibCreateViewController *xibCreateView =  [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"XibCreateViewController"];
    [self.navigationController pushViewController:xibCreateView animated:YES];
}

- (IBAction)CodeCreateView:(UIButton *)sender {
    CodeCreateViewController *codeCreateView = [[CodeCreateViewController alloc] init];
    [self.navigationController pushViewController:codeCreateView animated:YES];
}


- (IBAction)XibCreateTableView:(UIButton *)sender {
    XibCreateTableViewController *xibCreateTable =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"XibCreateTableViewController"];
    [self.navigationController pushViewController:xibCreateTable animated:YES];
}

- (IBAction)CodeCreateTable:(UIButton *)sender {
    CodeCreateTableViewController *createTableView = [[CodeCreateTableViewController alloc] init];
    [self.navigationController pushViewController:createTableView animated:YES];
}

- (IBAction)CodePullTableView:(UIButton *)sender {
    CodeCreatePullTableViewController *pullTable = [[CodeCreatePullTableViewController alloc] init];
    [self.navigationController pushViewController:pullTable animated:YES];
}

@end
