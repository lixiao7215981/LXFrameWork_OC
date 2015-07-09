//
//  SystemDebugTableViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/9.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "SystemDebugTableViewController.h"

@interface SystemDebugTableViewController ()

@end

@implementation SystemDebugTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCellDataList];
}

- (void)addCellDataList
{
    BaseArrowCellItem *arrowCell = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"接口请求日志" SubTitle:nil ClickOption:nil AndDetailClass:nil];
    BaseCellItem *baseCell = [BaseCellItem createBaseCellItemWithIcon:nil AndTitle:@"重设引导信息" SubTitle:nil ClickOption:nil];
    BaseArrowCellItem *ChooseServiewCell = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"选择服务器" SubTitle:nil ClickOption:nil AndDetailClass:nil];
    BaseArrowCellItem *ServiewMonitoring = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"服务器监控" SubTitle:nil ClickOption:nil AndDetailClass:nil];
    BaseArrowCellItem *TestPage = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"进入测试Page" SubTitle:nil ClickOption:nil AndDetailClass:nil];
    BaseArrowCellItem *CompelCrash = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"强制Crash" SubTitle:nil ClickOption:nil AndDetailClass:nil];
    BaseArrowCellItem *abnormalLog = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"异常日志" SubTitle:nil ClickOption:nil AndDetailClass:nil];
    BaseSwitchCellItem *openAbnormalLog = [BaseSwitchCellItem createBaseCellItemWithIcon:nil AndTitle:@"开启日志监控" SubTitle:nil ClickOption:^{
        NSLog(@"开启日志监控");
    } ];
    
    BaseCellItemGroup *group = [BaseCellItemGroup createGroupWithItem:@[arrowCell,baseCell,ChooseServiewCell,ServiewMonitoring,TestPage,CompelCrash,abnormalLog,openAbnormalLog]];
    [self.dataList addObject:group];
}
@end
