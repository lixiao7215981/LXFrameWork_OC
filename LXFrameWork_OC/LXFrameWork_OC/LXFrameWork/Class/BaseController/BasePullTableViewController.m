//
//  BasePullTableViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "BasePullTableViewController.h"

@interface BasePullTableViewController()

@end

@implementation BasePullTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingTableViewPull];
}

- (void)setTableViewStyle:(UITableViewStyle)tableViewStyle
{
    [super setTableViewStyle:tableViewStyle];
    [self settingTableViewPull];
}

- (void) settingTableViewPull
{
    MJRefreshNormalHeader *headRefresh =  [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    MJRefreshAutoNormalFooter *footerRefresh = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableView.mj_header = headRefresh;
    self.tableView.mj_footer = footerRefresh;
}

- (void) loadNewData
{
    
}

- (void)loadMoreData
{
    
}


@end
