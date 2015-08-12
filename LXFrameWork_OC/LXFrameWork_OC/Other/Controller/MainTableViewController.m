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
#import "HttpViewController.h"
#import "SysetmHttpDebugController.h"
#import "SetNavBarLeftRightViewController.h"

@interface MainTableViewController ()<QRCodeViewControllerDelegate>
{
    QRCodeViewController *_readCode;
}
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
        [SVProgressHUD showErrorWithStatus:@"模拟器不支持"];
#elif TARGET_OS_IPHONE
        __weak typeof(self) Main = self;
        _readCode = [[QRCodeViewController alloc] init];
        _readCode.delegate = Main;
        [self.navigationController presentViewController:_readCode animated:YES completion:nil];
#endif
        
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item2 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"向上拖动NavigationBar显示" SubTitle:nil ClickOption:^{
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
    
    BaseArrowCellItem *item6 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"发送请求" SubTitle:nil ClickOption:^{
        HttpViewController  *httpVC = [[HttpViewController alloc] init];
        [self.navigationController pushViewController:httpVC animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item7 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"查看调试选项" SubTitle:nil ClickOption:^{
        SystemDebugController *debug = [[SystemDebugController alloc] init];
        [self.navigationController pushViewController:debug animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item8 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"请求日志" SubTitle:nil ClickOption:^{
        SysetmHttpDebugController *httpDebug = [[SysetmHttpDebugController alloc] init];
        [self.navigationController pushViewController:httpDebug animated:YES];
    } AndDetailClass:nil];
    
    BaseCellItemGroup *group1 = [BaseCellItemGroup createGroupWithItem:@[item1,item2,item3,item4,item5,item6,item7,item8]];
    
    [self.dataList addObject:group1];
}

#pragma mark - 扫描二维码代理及相关方法

- (void)ReaderCode:(QRCodeViewController *)readerViewController didScanResult:(NSString *)result
{
    if(![result hasPrefix:@"http"]) return;
    [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"是否打开该连接:%@",result] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"打开", nil] show];
}

- (void)ReaderCoderDidCancel:(QRCodeViewController *)readerViewController
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSRange range = [alertView.message rangeOfString:@":"];
    NSString *http = [alertView.message substringFromIndex:range.location + 1];
    if (buttonIndex == 0) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }else if (buttonIndex == 1){
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:http]];
    }
}

@end