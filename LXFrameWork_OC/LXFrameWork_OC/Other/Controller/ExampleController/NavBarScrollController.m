//
//  NavBarScrollController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/8/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "NavBarScrollController.h"

@interface NavBarScrollController ()

@end

@implementation NavBarScrollController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"向上拖动"];
    
    // 添加数据
    [self addDataList];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    headView.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.3];
    self.tableView.tableHeaderView = headView;
    
    // NavigationBar 根据滚动变色
    self.displayNav = YES;
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

@end
