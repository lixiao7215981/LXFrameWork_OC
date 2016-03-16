//
//  HeadImageScorllController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/8/13.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "HeadImageScorllController.h"

@interface HeadImageScorllController ()

@end

@implementation HeadImageScorllController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.displayNavBarWhenScroll = YES;
    
    // 设置需要显示放大图片高度和图片
    self.scaleHeight = 200;
    self.scaleImage = [UIImage imageNamed:@"img_01"];
    
    // 添加数据
    [self addDataList];
}

- (void) addDataList
{
    BaseCellItemGroup *group = [[BaseCellItemGroup alloc] init];
    for (int i = 0; i < 30; i++) {
        BaseCellItem *item = [BaseCellItem createBaseCellItemWithIcon:nil AndTitle:[NSString stringWithFormat:@"我叫%d  我是打酱油的",i+1] SubTitle:nil ClickOption:nil];
        [group addObjectWith:item];
    }
    [self.dataList addObject:group];
}
@end
