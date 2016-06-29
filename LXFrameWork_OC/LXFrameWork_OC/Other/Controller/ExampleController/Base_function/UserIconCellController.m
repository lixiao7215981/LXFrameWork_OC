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
    [self setNavTitle:@"Cell样式展示"];
    self.tableViewStyle = UITableViewStyleGrouped;
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
    
    BaseCellItemGroup *group1 = [BaseCellItemGroup createGroupWithHeadView:nil AndFootView:nil OrItem:@[iconItem]];
    /*** 标题分割 */
    BaseCellItemGroup *group2 = [BaseCellItemGroup createGroupWithHeadTitle:nil AndFooterTitle:nil OrItem:@[iconItem2]];
    
    BaseSwitchCellItem *item1 = [BaseSwitchCellItem createBaseCellItemWithIcon:@"card_icon" AndTitle:@"BaseSwitchCellItem" SubTitle:@"SubTitle" defaultOpen:YES ClickOption:^{
        NSLog(@"点击了Cell，如果实现了 tableViewDidSelectRowAtIndexPatch 将不调用该block");
    } SwitchOption:^(UISwitch *cellSwitch) {
        NSLog(@"Switch------>%d",cellSwitch.on);
    }];
    
    BaseSwitchCellItem *item2 = [BaseSwitchCellItem createBaseCellItemWithIcon:nil AndTitle:@"BaseSwitchCellItem" SubTitle:@"SubTitle" defaultOpen:NO ClickOption:^{
        NSLog(@"点击了Cell，如果实现了 tableViewDidSelectRowAtIndexPatch 将不调用该block");
    } SwitchOption:^(UISwitch *cellSwitch) {
        NSLog(@"Switch------>%d",cellSwitch.on);
    }];
    
    BaseSwitchCellItem *item3 = [BaseSwitchCellItem createBaseCellItemWithIcon:nil AndTitle:@"BaseSwitchCellItem" SubTitle:nil defaultOpen:NO ClickOption:^{
        NSLog(@"点击了Cell，如果实现了 tableViewDidSelectRowAtIndexPatch 将不调用该block");
    } SwitchOption:^(UISwitch *cellSwitch) {
        NSLog(@"Switch------>%d",cellSwitch.on);
    }];
    
    BaseCellItemGroup *group3 = [BaseCellItemGroup createGroupWithItem:@[item1,item2,item3]];
    
    
    
    BaseArrowCellItem *item5 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"BaseArrowCellItem" SubTitle:nil ClickOption:nil];
    BaseArrowCellItem *item6 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"BaseArrowCellItem" SubTitle:@"SubTitle" ClickOption:nil];
    BaseCellItemGroup *group4 = [BaseCellItemGroup createGroupWithItem:@[item5,item6]];
    
    BaseSubtitleCellItem *item7 = [BaseSubtitleCellItem createBaseCellItemWithIcon:@"card_icon" AndTitle:@"BaseSubtitleCellItem" SubTitle:@"SubTitle" ClickOption:^{
        NSLog(@"BaseSubtitleCellItem");
    }];
    BaseSubtitleCellItem *item8 = [BaseSubtitleCellItem createBaseCellItemWithIcon:nil AndTitle:@"BaseSubtitleCellItem" SubTitle:@"SubTitle" ClickOption:^{
        NSLog(@"BaseSubtitleCellItem");
    }];
    BaseCellItemGroup *group5 = [BaseCellItemGroup createGroupWithItem:@[item7,item8]];
    
//    BaseCellItem *item4 = [BaseCellItem createBaseCellItemWithIcon:nil AndTitle:@"BaseCellItem" SubTitle:nil ClickOption:nil];
    
    BaseCenterTitleCellItem *item9 = [BaseCenterTitleCellItem createBaseCellItemWithCenterTitle:@"BaseCenterTitleCellItem" ClickOption:^{
        NSLog(@"BaseCenterTitleCellItem");
    } WithColor:[UIColor redColor]];
    
    BaseCellItemGroup *group6 = [BaseCellItemGroup createGroupWithItem:@[item9]];
    [self.dataList addObject:group1];
    [self.dataList addObject:group2];
    [self.dataList addObject:group3];
    [self.dataList addObject:group4];
    [self.dataList addObject:group5];
    [self.dataList addObject:group6];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}

@end
