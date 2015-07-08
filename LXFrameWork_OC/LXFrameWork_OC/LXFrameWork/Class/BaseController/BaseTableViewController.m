//
//  BaseTableViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/6/15.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    // 设置tableview
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UITableView class]] && view.tag == 0) {
            self.tableView = (UITableView *)view;
            break;
        }
    }
    
    if (!self.tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:self.tableView];
    }
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    BaseCellItemGroup *group = self.dataList[section];
    return group.item.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewCell *cell = nil;
    cell = [BaseTableViewCell createProfileBaseCellWithTableView:tableView andCellStyle:UITableViewCellStyleDefault];
    BaseCellItemGroup *group = self.dataList[indexPath.section];
    BaseCellItem *item = group.item[indexPath.row];
    cell.items = item;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 手动取消选中某一行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    BaseCellItemGroup *group = self.dataList[indexPath.section];
    BaseCellItem *item = group.item[indexPath.row];
    
    // 如果有block 就执行block 中的操作
    if (item.option) {
        item.option();
        return;
    }
    // 判断是否为箭头样式的cell 操作就是跳转控制器的操作
    if ([item isKindOfClass:[BaseArrowCellItem class]]) {
        BaseArrowCellItem *arrowItem = (BaseArrowCellItem *)item;
        if (arrowItem.detailClass) {
            UIViewController *VC = [[arrowItem.detailClass alloc] init];
            VC.navigationItem.title = item.title;
            [self.navigationController pushViewController:VC animated:YES];
        }
    }
    
    //    else if ([item isKindOfClass:[BaseSwitchCellItem class]]){
    //        BaseSwitchCellItem *switchCell = (BaseSwitchCellItem *) item;
    //        if (switchCell.switchOption) {
    //            switchCell.switchOption();
    //        }
    //    }
    
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    BaseCellItemGroup *group = self.dataList[section];
    return group.headTitle;
}

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    BaseCellItemGroup *group = self.dataList[section];
    return group.footerTitle;
}

//- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    BaseCellItemGroup *group = self.dataList[section];
//    return group.headView;
//}
//
//- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    BaseCellItemGroup *group = self.dataList[section];
//    return group.footerView;
//}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor *color = [UIColor whiteColor];
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"%f",offsetY);
    if (offsetY > 0) {
        CGFloat alpha = 1 - ((64 - offsetY) / 64);
        [self.navView setNavigationBarBackColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navView setNavigationBarBackColor:[color colorWithAlphaComponent:0]];
    }
}

#pragma mark - 懒加载
- (NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [[NSMutableArray alloc] init];
    }
    return _dataList;
}

@end
