//
//  MainTableViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/8/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "MainTableViewController.h"
#import "QRCodeViewController.h"
#import "NavBarScrollController.h"
#import "HavePullViewController.h"
#import "UserIconCellController.h"
#import "BaseTableViewController.h"
#import "SystemDebugController.h"
#import "SetNavBarLeftRightViewController.h"

@interface MainTableViewController ()<QRCodeViewControllerDelegate>

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addDataList];
    [self setNavTitle:@"LXFrameWork_OC"];
}

- (void) addDataList
{
    BaseArrowCellItem *item1 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"二维码" SubTitle:nil ClickOption:^{
#if TARGET_IPHONE_SIMULATOR
        [SVProgressHUD showErrorWithStatus:@"模拟器不支持摄像头"];
#elif TARGET_OS_IPHONE
        __weak typeof(self) Main = self;
        QRCodeViewController *readCode = [[QRCodeViewController alloc] init];
        readCode.delegate = Main;
        [self.navigationController presentViewController:readCode animated:YES completion:nil];
#endif
        
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item2 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"向上滚动NavigationBar显示" SubTitle:nil ClickOption:^{
        NavBarScrollController *navBarScroll = [[NavBarScrollController alloc] init];
        [self.navigationController pushViewController:navBarScroll animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item3 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"带下拉上拉刷新" SubTitle:nil ClickOption:^{
        HavePullViewController *pull = [[HavePullViewController alloc] init];
        [self.navigationController pushViewController:pull animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item4 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"Cell样式展示" SubTitle:nil ClickOption:^{
        UserIconCellController *icon = [[UserIconCellController alloc] init];
        [self.navigationController pushViewController:icon animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item5 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"设置NavBar的左中右按钮或标题" SubTitle:nil ClickOption:^{
        SetNavBarLeftRightViewController  *navVar = [[SetNavBarLeftRightViewController alloc] init];
        [self.navigationController pushViewController:navVar animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item6 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"查看调试选项" SubTitle:nil ClickOption:^{
        SystemDebugController *debug = [[SystemDebugController alloc] init];
        [self.navigationController pushViewController:debug animated:YES];
    } AndDetailClass:nil];
    
    
    BaseCellItemGroup *group1 = [BaseCellItemGroup createGroupWithItem:@[item1,item2,item3,item4,item5,item6]];
    
    [self.dataList addObject:group1];
}

- (void)ReaderCode:(QRCodeViewController *)readerViewController didScanResult:(NSString *)result
{
    NSLog(@"%@",result);
}

- (void)ReaderCoderDidCancel:(QRCodeViewController *)readerViewController
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


@end
