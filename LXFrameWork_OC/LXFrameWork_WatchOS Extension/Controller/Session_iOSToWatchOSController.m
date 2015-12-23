//
//  Session_iOSToWatchOSController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/12/23.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import "Session_iOSToWatchOSController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface Session_iOSToWatchOSController ()<WCSessionDelegate>

@property (nonatomic,strong) WCSession *session;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *messageLabel;

@end

@implementation Session_iOSToWatchOSController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    if ([WCSession isSupported]) {
        self.session = [WCSession defaultSession];
        self.session.delegate = self;
        [self.session activateSession];
    }
}

#pragma mark - 都在前台接收返回 NSDictionary
- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message
{
    [self.messageLabel setText:[message objectForKey:@"send"]];
}

- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message replyHandler:(void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler
{
    [self.messageLabel setText:[message objectForKey:@"send"]];
    
    replyHandler(@{@"result":@"WatchOS 发送给 iOS 端数据"});
}

#pragma mark - 都在前台接收返回 NSData
- (void)session:(WCSession *)session didReceiveMessageData:(NSData *)messageData
{
    [self.messageLabel setText:[[NSString alloc] initWithData:messageData encoding:NSUTF8StringEncoding]];
}

- (void)session:(WCSession *)session didReceiveMessageData:(NSData *)messageData replyHandler:(void (^)(NSData * _Nonnull))replyHandler
{
    [self.messageLabel setText:[[NSString alloc] initWithData:messageData encoding:NSUTF8StringEncoding]];
    
    NSString *result = @"WatchOS 发送给 iOS 端数据";
    NSData *data = [result dataUsingEncoding:NSUTF8StringEncoding];
    replyHandler(data);
}

#pragma mark - 有一端在后台接收

- (void)session:(WCSession *)session didReceiveFile:(WCSessionFile *)file
{
    if (file.metadata) {
        [self.messageLabel setText:@"接收到 iOS 发送的文件"];
    }
}

- (void)session:(WCSession *)session didFinishFileTransfer:(WCSessionFileTransfer *)fileTransfer error:(NSError *)error
{
    [self.messageLabel setText:@"didFinishFileTransfer"];
}

- (void)session:(WCSession *)session didReceiveUserInfo:(NSDictionary<NSString *,id> *)userInfo
{
    //   [self.messageLabel setText:[userInfo objectForKey:@"send"]];
    [self.messageLabel setText:@"didReceiveUserInfo"];
}

- (void)session:(WCSession *)session didFinishUserInfoTransfer:(WCSessionUserInfoTransfer *)userInfoTransfer error:(NSError *)error
{
    [self.messageLabel setText:@"didFinishUserInfoTransfer"];
}

- (void)session:(WCSession *)session didReceiveApplicationContext:(NSDictionary<NSString *,id> *)applicationContext
{
    [self.messageLabel setText:@"didReceiveApplicationContext"];
}

- (void)sessionReachabilityDidChange:(WCSession *)session
{
    [self.messageLabel setText:@"sessionReachabilityDidChange"];
}



- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



