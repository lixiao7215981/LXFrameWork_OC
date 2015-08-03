//
//  CodeCreateTableViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/9.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "CodeCreateTableViewController.h"

@interface CodeCreateTableViewController ()

@end

@implementation CodeCreateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    BaseIconItem *iconItem = [BaseIconItem createBaseCellItemWithIcon:@"bg_login" AndTitle:@"用户名" SubTitle:@"绑定手机:18612791505" ClickOption:nil];
    
    BaseIconItem *iconItem = [BaseIconItem createBaseCellItemWithIconNameOrUrl:@"bg_login" AndTitle:@"用户名" SubTitle:@"绑定手机:18612791505" ClickCellOption:^{
        NSLog(@"点击了Cell");
    } ClickIconOption:^{
        NSLog(@"点击了Icon");
    }];
    
    BaseIconItem *iconItem2 = [BaseIconItem createBaseCellItemWithIconNameOrUrl:@"bg_login" AndTitle:@"用户名" SubTitle:nil ClickCellOption:nil ClickIconOption:^{
        NSLog(@"点击了Icon");
    }];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 20)];
    view1.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 20)];
    view2.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    
    BaseCellItemGroup *group1 = [BaseCellItemGroup createGroupWithHeadView: iconItem.sectionView AndFootView:iconItem.sectionView OrItem:@[iconItem]];
    
    BaseCellItemGroup *group2 = [BaseCellItemGroup createGroupWithHeadView: iconItem.sectionView AndFootView:iconItem.sectionView OrItem:@[iconItem2]];
    
    
    BaseCellItem *item = [BaseCellItem createBaseCellItemWithIcon:nil AndTitle:@"啊但是发生地方" SubTitle:nil ClickOption:nil];
    BaseCellItem *item2 = [BaseCellItem createBaseCellItemWithIcon:nil AndTitle:@"啊但是发生地方" SubTitle:nil ClickOption:nil];
    BaseCellItem *item3 = [BaseCellItem createBaseCellItemWithIcon:nil AndTitle:@"啊撒旦发射点法" SubTitle:nil ClickOption:nil];
    BaseCellItem *item4 = [BaseCellItem createBaseCellItemWithIcon:nil AndTitle:@"啊撒旦发射点法" SubTitle:nil ClickOption:nil];
    BaseCellItemGroup *group = [BaseCellItemGroup createGroupWithItem:@[item,item2,item3,item4]];
    [self.dataList addObject:group1];
    [self.dataList addObject:group2];
    [self.dataList addObject:group];
}


//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 100;
//}

//- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSString *cellID = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
//    }
//    cell.textLabel.text = [NSString stringWithFormat:@"第%ld条测试数据",indexPath.row];
//    return cell;
//}

@end
