//
//  AppDelegate.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/12/22.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomQRCodeViewController.h"

@implementation AppDelegate


/**
 *  3D-Touch
 *
 *  @param application       UIApplication
 *  @param shortcutItem      点击的Item
 *  @param completionHandler 当应用并非在后台，而是直接重新开进程的时候，直接返回No，那么这个时候，我们的回调会放在 didFinishLaunchingWithOptions
 *  UIApplication又给我们一个从launchOptions中获取这个shortcutItem的key(UIApplicationLaunchOptionsShortcutItemKey)
 *  UIApplicationShortcutItem *item = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
 *
 */
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler{
    if (shortcutItem) {
        //判断先前我们设置的唯一标识
        NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
        NSString *searchItemType1 = [NSString stringWithFormat:@"%@.Search",bundleIdentifier];
        NSString *searchItemType2 = [NSString stringWithFormat:@"%@.QRCode",bundleIdentifier];
        
        if([shortcutItem.type isEqualToString:searchItemType1]){
            
        }else if ([shortcutItem.type isEqualToString:searchItemType2]){
            CustomQRCodeViewController *qrcode = [[CustomQRCodeViewController alloc] init];
            [self.window.rootViewController presentViewController:qrcode animated:YES completion:^{
            }];
        }
    }
    
    if (completionHandler) {
        completionHandler(YES);
    }
}




@end
