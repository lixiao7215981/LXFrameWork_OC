//
//  HavePullViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/8/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "HavePullViewController.h"

@interface HavePullViewController ()

@end

@implementation HavePullViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"拉动刷新"];
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
    [self.tableView reloadData];
}

- (void)loadNewData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.header endRefreshing];
    });
}

- (void)loadMoreData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //        [self.tableView.footer resetNoMoreData];
        [self.tableView.footer noticeNoMoreData];
        
    });
}


@end
