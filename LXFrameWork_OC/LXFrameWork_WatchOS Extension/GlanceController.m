//
//  GlanceController.m
//  LXFrameWork_WatchOS Extension
//
//  Created by 李晓 on 15/12/21.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import "GlanceController.h"

@interface GlanceController()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *imageView;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *labelView;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *footLabel;

@end


@implementation GlanceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // 加载数据设置页面显示数据
    [self.imageView setImageNamed:@"img_01"];
    [self.labelView setText:@"这是一个GlanceDemo，在表盘界面向上滑动显示，用于快速显示app简要信息"];
    [self.footLabel setText:@"End----------------"];
}

- (void)willActivate {
    [super willActivate];
    /**
     *  点击了 Glance 默认会打开主程序首页，如果你想显示一个不同的界面控制器
     *  需要在 awakeWithContext 或者 willActivate 里 调用updateUserActivity 方法,传递一个Dictionary
     *  在主程序中首页控制器实现 - (void)handleUserActivity:(NSDictionary *)userInfo
     */
     [self updateUserActivity:@"WKGoToViewController" userInfo:@{@"GoToViewController":@"modalController"} webpageURL:nil];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



