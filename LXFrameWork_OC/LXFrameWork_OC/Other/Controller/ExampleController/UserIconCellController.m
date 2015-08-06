//
//  UserIconCellController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/8/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "UserIconCellController.h"

@interface UserIconCellController ()

@end

@implementation UserIconCellController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"显示用户头像"];
    [self addDataList];
}

- (void) addDataList
{
    BaseIconItem *iconItem = [BaseIconItem createBaseCellItemWithIconNameOrUrl:@"user_defaultavatar" AndTitle:@"用户名" SubTitle:@"绑定手机:18612791505" ClickCellOption:^{
        NSLog(@"点击了Cell");
    } ClickIconOption:^{
        NSLog(@"点击了Icon");
    }];
    
    BaseIconItem *iconItem2 = [BaseIconItem createBaseCellItemWithIconNameOrUrl:@"user_defaultavatar" AndTitle:@"用户名" SubTitle:nil ClickCellOption:nil ClickIconOption:^{
        NSLog(@"点击了Icon");
    }];
    
    BaseCellItemGroup *group1 = [BaseCellItemGroup createGroupWithHeadView: iconItem.sectionView AndFootView:iconItem.sectionView OrItem:@[iconItem]];
    
    BaseCellItemGroup *group2 = [BaseCellItemGroup createGroupWithHeadView: iconItem.sectionView AndFootView:iconItem.sectionView OrItem:@[iconItem2]];
    
    
    BaseArrowCellItem *item = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"消息提醒" SubTitle:nil ClickOption:nil];
    BaseArrowCellItem *item2 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"版本管理" SubTitle:nil ClickOption:nil];
    BaseArrowCellItem *item3 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"我的信息" SubTitle:nil ClickOption:nil];
    BaseArrowCellItem *item4 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"关于" SubTitle:nil ClickOption:nil];
    BaseCellItemGroup *group = [BaseCellItemGroup createGroupWithItem:@[item,item2,item3,item4]];
    [self.dataList addObject:group1];
    [self.dataList addObject:group2];
    [self.dataList addObject:group];
}

@end
