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
#import "SystemDebugController.h"
#import "HttpViewController.h"
#import "WebViewController.h"
#import "SysetmHttpDebugController.h"
#import "HeadImageScorllController.h"
#import "SetNavBarLeftRightViewController.h"
#import "CustomQRCodeViewController.h"
#import "PeekAndPopViewController.h"
#import "WriteViewController.h"

#define SYSTEM_VERSION_LESS_THAN(v)([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface MainTableViewController ()<QRCodeViewControllerDelegate>
{
    QRCodeViewController *_readCode;
}
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"LXFrameWork_OC"];
    [self addDataList];
    [NSThread sleepForTimeInterval:1.5];
}

- (void) addDataList
{
    
#pragma mark - Group1
    BaseArrowCellItem *Group1_item1 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"生成二维码" SubTitle:nil ClickOption:^{
        CustomQRCodeViewController *qrcode = [[CustomQRCodeViewController alloc] init];
        [self.navigationController pushViewController:qrcode animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *Group1_item2 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"二维码扫描" SubTitle:nil ClickOption:^{
#if TARGET_IPHONE_SIMULATOR
        [SVProgressHUD showErrorWithStatus:@"模拟器不支持"];
#elif TARGET_OS_IPHONE
        __weak typeof(self) Main = self;
        _readCode = [[QRCodeViewController alloc] init];
        _readCode.delegate = Main;
        [self.navigationController presentViewController:_readCode animated:YES completion:nil];
#endif
        
    } AndDetailClass:nil];
    
    BaseArrowCellItem *Group1_item3 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"向上拖动NavigationBar显示" SubTitle:nil ClickOption:^{
        NavBarScrollController *navBarScroll = [[NavBarScrollController alloc] init];
        [self.navigationController pushViewController:navBarScroll animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *Group1_item4 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"下拉放大头部IMG" SubTitle:nil ClickOption:^{
        HeadImageScorllController *headViewScroll = [[HeadImageScorllController alloc] init];
        [self.navigationController pushViewController:headViewScroll animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *Group1_item5 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"带下拉上拉刷新" SubTitle:nil ClickOption:^{
        HavePullViewController *pull = [[HavePullViewController alloc] init];
        [self.navigationController pushViewController:pull animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *Group1_item6 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"Cell样式展示" SubTitle:nil ClickOption:^{
        UserIconCellController *icon = [[UserIconCellController alloc] init];
        [self.navigationController pushViewController:icon animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *Group1_item7 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"BaseWebView" SubTitle:nil ClickOption:^{
        WebViewController *webView = [[WebViewController alloc] init];
        [self.navigationController pushViewController:webView animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *Group1_item8 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"设置NavBar的左中右按钮或标题" SubTitle:nil ClickOption:^{
        SetNavBarLeftRightViewController  *navVar = [[SetNavBarLeftRightViewController alloc] init];
        [self.navigationController pushViewController:navVar animated:YES];
    } AndDetailClass:nil];
    
#pragma mark - Group2
    
    BaseArrowCellItem *Group2_item1 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"发送请求" SubTitle:nil ClickOption:^{
        HttpViewController  *httpVC = [[HttpViewController alloc] init];
        [self.navigationController pushViewController:httpVC animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *Group2_item2 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"查看调试选项" SubTitle:nil ClickOption:^{
        SystemDebugController *debug = [[SystemDebugController alloc] init];
        [self.navigationController pushViewController:debug animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *Group2_item3 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"请求日志" SubTitle:nil ClickOption:^{
        SysetmHttpDebugController *httpDebug = [[SysetmHttpDebugController alloc] init];
        [self.navigationController pushViewController:httpDebug animated:YES];
    } AndDetailClass:nil];
    
#pragma mark - Group3
    
    BaseArrowCellItem *group3_item1 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"PeekAndPop" SubTitle:nil ClickOption:^{
        PeekAndPopViewController *writeView = [[PeekAndPopViewController alloc] init];
        [self.navigationController pushViewController:writeView animated:YES];
    } AndDetailClass:nil];
    
#pragma mark - Group4
    
    BaseArrowCellItem *group4_item1 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"WriteViewController" SubTitle:nil ClickOption:^{
        WriteViewController *writeView = [[WriteViewController alloc] initWithNibName:@"WriteViewController" bundle:nil];
        [self.navigationController pushViewController:writeView animated:YES];
    } AndDetailClass:nil];
    
    BaseCellItemGroup *group1 = [BaseCellItemGroup createGroupWithItem:@[Group1_item1,Group1_item2,Group1_item3,Group1_item4,Group1_item5,Group1_item6,Group1_item7,Group1_item8]];
    BaseCellItemGroup *group2 = [BaseCellItemGroup createGroupWithHeadTitle:@"系统工具" AndFooterTitle:nil OrItem:@[Group2_item1,Group2_item2,Group2_item3]];
    BaseCellItemGroup *group3 = [BaseCellItemGroup createGroupWithHeadTitle:@"iOS 9 新功能" AndFooterTitle:nil OrItem:@[group3_item1]];
    BaseCellItemGroup *group4 = [BaseCellItemGroup createGroupWithHeadTitle:@"测试条目" AndFooterTitle:nil OrItem:@[group4_item1]];
    
    [self.dataList addObject:group1];
    [self.dataList addObject:group2];
    [self.dataList addObject:group3];
    [self.dataList addObject:group4];
}

#pragma mark - 扫描二维码代理及相关方法i

- (void)ReaderCode:(QRCodeViewController *)readerViewController didScanResult:(NSString *)result
{
    if([result hasPrefix:@"http"]){
        [[[UIAlertView alloc] initWithTitle:@"消息" message:[NSString stringWithFormat:@"是否打开该连接:%@",result] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"打开", nil] show];
    }else{
        [[[UIAlertView alloc] initWithTitle:@"消息" message:result delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil,nil] show];
    }
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
