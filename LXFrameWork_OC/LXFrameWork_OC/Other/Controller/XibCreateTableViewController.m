//
//  XibCreateTableViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/9.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "XibCreateTableViewController.h"

@interface XibCreateTableViewController ()

@end

@implementation XibCreateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BaseCellItem *item = [BaseCellItem createBaseCellItemWithIcon:nil AndTitle:@"1111" SubTitle:nil ClickOption:nil];
    
    BaseCellItemGroup *group = [BaseCellItemGroup createGroupWithItem:@[item]];
    [self.dataList addObject:group];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    headView.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.3];
    self.tableView.tableHeaderView = headView;
    
    self.displayNav = YES;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld条测试数据",indexPath.row];
    return cell;
}


@end
