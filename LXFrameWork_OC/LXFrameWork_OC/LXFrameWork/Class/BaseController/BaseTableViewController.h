//
//  BaseTableViewController.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/6/15.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseCellItemGroup.h"
#import "BaseCellItem.h"
#import "BaseArrowCellItem.h"
#import "BaseCenterTitleCellItem.h"
#import "BaseSwitchCellItem.h"
#import "BaseTableViewCell.h"
#import <MJRefresh.h>

@interface BaseTableViewController : BaseViewController

/** 自定义的TableView */
@property (nonatomic,strong) UITableView *tableView;

/** UITableView数据源 */
@property (nonatomic,strong) NSMutableArray *dataList;

/** TableView 实时滚动展示NavigationBar */
@property (nonatomic,assign) BOOL displayNav;


@end
