//
//  MenuCenterViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 16/10/13.
//  Copyright © 2016年 LXFrameWork. All rights reserved.
//

#import "MenuCenterViewController.h"
#import "BaseLineTableViewCell.h"
#import "BaseMenuCenterView.h"

@interface MenuCenterViewController ()<UITableViewDelegate,UITableViewDataSource,BaseMenuCenterViewDelegate>

@property (nonatomic,strong) NSMutableArray *radioArray;
@property (nonatomic,strong) NSMutableArray *MultiselectArray;

@end

@implementation MenuCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavTitle:@"中间弹出单选多选菜单"];
    self.tableView.separatorStyle = UITableViewScrollPositionNone;
    [self addDataSource];
}

- (void) addDataSource
{
    [self.dataList removeAllObjects];
    [self.dataList addObject:@"点击弹出单选菜单"];
    [self.dataList addObject:@"点击弹出多选菜单"];
}

#pragma mark - TableViewDelegate/DataSource

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.dataList.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"MenuCenterViewControllerCellID";
    BaseLineTableViewCell *cell = [BaseLineTableViewCell createCellWithXibName:nil TableView:tableView Identifier:cellID];
    cell.textLabel.text = [self.dataList objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:17];
    if (indexPath.row) {
        [cell cellAsLastTableCell];
    }else{
        [cell cellAsFirstTableCell];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row) {
        BaseMenuCenterView *listView = [[BaseMenuCenterView alloc] initWithSelectType:Multiselect];
        listView.tag = 0;
        listView.title = @"多选类型";
        listView.delegate = self;
        listView.dataList = self.MultiselectArray;
        [listView showView];
    }else{
        BaseMenuCenterView *listView = [[BaseMenuCenterView alloc] init];
        listView.tag = 0;
        listView.title = @"单选类型";
        listView.delegate = self;
        listView.dataList = self.radioArray;
        [listView showView];
    }
}

#pragma mark - BaseMenuCenterViewDelegate


/**
 BaseMenuCenter 单选类型Delegae
 
 @param baseMenuCenterView BaseMenuCenterView
 @param indexPath          所选择项的 indexPath
 */
- (void)BaseMenuCenterViewDelegate:(BaseMenuCenterView *)baseMenuCenterView didSelectAtIndexPath:(NSIndexPath *)indexPath
{
    BaseLineTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.textLabel.text = [self.radioArray objectAtIndex:indexPath.row];
}

/**
 BaseMenuCenter 多选类型Delegae
 
 @param baseMenuCenterView BaseMenuCenterView
 @param indexPath          所选择项的Array [indexPath,indexPath,indexPath]
 */
- (void)BaseMenuCenterViewDelegate:(BaseMenuCenterView *)baseMenuCenterView didClickConfirm:(NSArray *)array
{
    BaseLineTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    NSMutableString *multiseSelect = [NSMutableString string];
    [array enumerateObjectsUsingBlock:^(NSIndexPath *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [multiseSelect appendString:[self.MultiselectArray objectAtIndex:obj.row]];
    }];
    cell.textLabel.text= multiseSelect;
}

#pragma mark - 懒加载

- (NSMutableArray *)radioArray
{
    if (!_radioArray) {
        _radioArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 20; i ++) {
            [_radioArray addObject:[NSString stringWithFormat:@"选项-%d",i]];
        }
    }
    return _radioArray;
}

- (NSMutableArray *)MultiselectArray
{
    if (!_MultiselectArray) {
        _MultiselectArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 20; i ++) {
            [_MultiselectArray addObject:[NSString stringWithFormat:@"选项-%d",i]];
        }
    }
    return _MultiselectArray;
}

@end
