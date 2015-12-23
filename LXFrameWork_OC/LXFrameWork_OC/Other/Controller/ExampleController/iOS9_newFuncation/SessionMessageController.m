//
//  SessionMessageController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/12/23.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import "SessionMessageController.h"
#import <WatchConnectivity/WatchConnectivity.h>
#define BUNDLE_PATH(name) [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: (name)]
@interface SessionMessageController()<WCSessionDelegate>

@property (nonatomic,strong) WCSession *session;

@end

@implementation SessionMessageController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavTitle:@"WatchOS2"];
    
    // 创建 Session
    [self createSession];
    // 添加DataList
    [self addDataList];
}

/**
 *  创建与 WatchOS 的Session
 */
- (void) createSession
{
    if ([WCSession isSupported]) {
        self.session = [WCSession defaultSession];
        self.session.delegate = self;
        [self.session activateSession];
    }
}

- (void) addDataList
{
    // 当 iOS app 和 watch app 都在前台的时候可以使用如下两种方式发送请求
    BaseArrowCellItem *Group1_item1 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"iOS->WatchOS(NSDictionary) 仅发送" SubTitle:nil ClickOption:^{
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params setObject:@"接收到iOS发送的消息(NSDictionary)" forKey:@"send"];
        [self.session sendMessage:params replyHandler:nil errorHandler:^(NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
    }];
    
    BaseArrowCellItem *Group1_item2 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"iOS->WatchOS(NSDictionary) 接收result" SubTitle:nil ClickOption:^{
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params setObject:@"接收到iOS发送的消息(NSDictionary),即将返回消息" forKey:@"send"];
        [self.session sendMessage:params replyHandler:^(NSDictionary<NSString *,id> * _Nonnull replyMessage) {
            NSString *result = [replyMessage objectForKey:@"result"];
            dispatch_async(dispatch_get_main_queue(), ^{
                [[[UIAlertView alloc] initWithTitle:@"收到返回" message:result delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil]show];
            });
        } errorHandler:^(NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
    }];
    
    BaseArrowCellItem *Group1_item3 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"iOS->WatchOS(NSData) 仅发送" SubTitle:nil ClickOption:^{
        NSString *send = @"接收到iOS发送的消息(NSData)";
        NSData *data = [send dataUsingEncoding:NSUTF8StringEncoding];
        [self.session sendMessageData:data replyHandler:nil errorHandler:^(NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
    }];
    
    BaseArrowCellItem *Group1_item4 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"iOS->WatchOS(NSData) 接收result" SubTitle:nil ClickOption:^{
        NSString *send = @"接收到iOS发送的消息(NSData),即将返回消息";
        NSData *data = [send dataUsingEncoding:NSUTF8StringEncoding];
        [self.session sendMessageData:data replyHandler:^(NSData * _Nonnull replyMessageData) {
            NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            dispatch_async(dispatch_get_main_queue(), ^{
                [[[UIAlertView alloc] initWithTitle:@"收到返回" message:result delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil]show];
            });
        } errorHandler:^(NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
    }];
    
#pragma mark - Group2
    // 当 iOS app 和 watch app 有一端在后台的时候使用如下方式发送请求
    
    /**
     *  updateApplicationContext  和 UserInfo 区别在于 Application Context 将会使用新的数据覆盖原来的内容，而 User Info 则可以使多次内容形成队列进行传送
     */
    BaseArrowCellItem *Group2_item1 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"iOS->WatchOS（UserInfo）"  SubTitle:nil ClickOption:^{
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params setObject:@"接收到iOS发送的消息" forKey:@"send"];
        [self.session transferUserInfo:params];
    }];
    
    BaseArrowCellItem *Group2_item2 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"iOS->WatchOS （CurrentComplicationUserInfo）"  SubTitle:nil ClickOption:^{
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params setObject:@"接收到iOS发送的消息" forKey:@"send"];
        [self.session transferCurrentComplicationUserInfo:params];
    }];
    
    BaseArrowCellItem *Group2_item3 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"iOS->WatchOS (File)"  SubTitle:nil ClickOption:^{
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params setObject:@"接收到iOS发送的消息" forKey:@"send"];
        NSURL *url = [NSURL URLWithString:[BUNDLE_PATH(LXFrameWorkBundle) stringByAppendingPathComponent :@"navigationbar_back"]];
        [self.session transferFile:url metadata:params];
    }];
    
    
    /**
     *  updateApplicationContext
     */
    BaseArrowCellItem *Group2_item4 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"iOS->WatchOS (updateApplicationContext)"  SubTitle:nil ClickOption:^{
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params setObject:@"接收到iOS发送的消息" forKey:@"send"];
        NSError *error;
        [self.session updateApplicationContext:params error:&error];
        if (error) {
            NSLog(@"%@",error);
        }
    }];
    
    BaseCellItemGroup *group1 = [BaseCellItemGroup createGroupWithHeadTitle:@"iOS -> WatchOS 都在前台" AndFooterTitle:nil OrItem:@[Group1_item1,Group1_item2,Group1_item3,Group1_item4]];
    
    BaseCellItemGroup *group2 = [BaseCellItemGroup createGroupWithHeadTitle:@"iOS -> WatchOS 有一端在后台" AndFooterTitle:nil OrItem:@[Group2_item1,Group2_item2,Group2_item3,Group2_item4]];
    
    [self.dataList addObjectsFromArray:@[group1,group2]];
    [self.tableView reloadData];
    
}

@end
