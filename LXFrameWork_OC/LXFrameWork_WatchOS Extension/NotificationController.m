//
//  NotificationController.m
//  LXFrameWork_WatchOS Extension
//
//  Created by 李晓 on 15/12/21.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import "NotificationController.h"


@interface NotificationController()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *Ntitle;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *Ntheme;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *Nalert;

@end


@implementation NotificationController

- (instancetype)init {
    self = [super init];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

/**
 *  收到本地通知的时候会调用
 */
- (void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}

/**
 *  收到远程通知的时候会调用
 *
 *  @param remoteNotification 根据模拟的 PushNotificationPayload.apns 文件演示通知
 *  @param completionHandler  回调方法确定用来显示通知的类型
 */
- (void)didReceiveRemoteNotification:(NSDictionary *)remoteNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    if(remoteNotification){
        NSDictionary *dict = [remoteNotification objectForKey:@"aps"];
        NSString *category = dict[@"category"];
        if ([category isEqualToString:@"myCategory"]) {
            NSString *alert = dict[@"alert"];
            NSString *title = dict[@"title"];
            NSString *theme = dict[@"theme"];
            
            [self.Ntitle setText:title];
            [self.Ntheme setText:theme];
            [self.Nalert setText:alert];
        }
    }
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}

@end



