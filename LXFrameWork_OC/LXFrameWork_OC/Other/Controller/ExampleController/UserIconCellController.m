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
    [self setNavTitle:@"Cell展示"];
    [self addDataList];
}

- (void) addDataList
{
    BaseIconItem *iconItem = [BaseIconItem createBaseCellItemWithIconNameOrUrl:@"user_defaultavatar" AndTitle:@"BaseIconItem" SubTitle:@"绑定手机:18612791505" ClickCellOption:^{
        NSLog(@"点击了Cell");
    } ClickIconOption:^{
        NSLog(@"点击了Icon");
    }];
    
    /**
     *  ClickCellOption == nil    将不显示Cell右侧剪头
     *  SubTitle == nil           Title 将水平居中显示
     */
    BaseIconItem *iconItem2 = [BaseIconItem createBaseCellItemWithIconNameOrUrl:@"user_defaultavatar" AndTitle:@"BaseIconItem" SubTitle:nil ClickCellOption:nil ClickIconOption:^{
        NSLog(@"点击了Icon");
    }];
    
    /**
     *  分割的View
     */
    BaseCellItemGroup *group1 = [BaseCellItemGroup createGroupWithHeadView: iconItem.sectionView AndFootView:iconItem.sectionView OrItem:@[iconItem]];
    /**
     *  标题分割
     */
    BaseCellItemGroup *group2 = [BaseCellItemGroup createGroupWithHeadTitle:@"头部标题" AndFooterTitle:@"尾部标题" OrItem:@[iconItem2]];
    
    
    BaseSwitchCellItem *item1 = [BaseSwitchCellItem createBaseCellItemWithIcon:@"card_icon" AndTitle:@"BaseSwitchCellItem" SubTitle:@"SubTitle" ClickOption:^{
        NSLog(@"Switch------>OFF  NO");
    }];
    BaseSwitchCellItem *item2 = [BaseSwitchCellItem createBaseCellItemWithIcon:nil AndTitle:@"BaseSwitchCellItem" SubTitle:@"SubTitle" ClickOption:^{
        NSLog(@"Switch------>OFF  NO");
    }];
    
    BaseSwitchCellItem *item3 = [BaseSwitchCellItem createBaseCellItemWithIcon:nil AndTitle:@"BaseSwitchCellItem" SubTitle:nil ClickOption:^{
        NSLog(@"Switch------>OFF  NO");
    }];
    
    BaseCellItem *item4 = [BaseCellItem createBaseCellItemWithIcon:nil AndTitle:@"BaseCellItem" SubTitle:nil ClickOption:nil];
    
    BaseArrowCellItem *item5 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"BaseArrowCellItem" SubTitle:nil ClickOption:nil];
    BaseArrowCellItem *item6 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"BaseArrowCellItem" SubTitle:@"SubTitle" ClickOption:nil];
    
    BaseSubtitleCellItem *item7 = [BaseSubtitleCellItem createBaseCellItemWithIcon:@"card_icon" AndTitle:@"BaseSubtitleCellItem" SubTitle:@"SubTitle" ClickOption:^{
        NSLog(@"BaseSubtitleCellItem");
    }];
    BaseSubtitleCellItem *item8 = [BaseSubtitleCellItem createBaseCellItemWithIcon:nil AndTitle:@"BaseSubtitleCellItem" SubTitle:@"SubTitle" ClickOption:^{
        NSLog(@"BaseSubtitleCellItem");
    }];
    
    BaseCenterTitleCellItem *item9 = [BaseCenterTitleCellItem createBaseCellItemWithCenterTitle:@"BaseCenterTitleCellItem" ClickOption:^{
        NSLog(@"BaseCenterTitleCellItem");
    } WithColor:[UIColor redColor]];
    
    BaseCellItemGroup *group = [BaseCellItemGroup createGroupWithItem:@[item1,item2,item3,item4,item5,item6,item7,item8,item9]];
    [self.dataList addObject:group1];
    [self.dataList addObject:group2];
    [self.dataList addObject:group];
}

@end
