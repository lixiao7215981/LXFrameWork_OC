//
//  DownMenuViewController.m
//  FrozenMall
//
//  Created by 李晓 on 16/4/24.
//  Copyright © 2016年 haier. All rights reserved.
//

#import "DownMenuViewController.h"

static NSString * const DownMenuTableViewID = @"DownMenuTableViewID";

@interface DownMenuViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_downMenuTableView;
    UIButton *_coverBtn;
    NSArray *_viewSizeConstraint;
    NSInteger _tag;
    BOOL _isShowMenu;
}
@end

@implementation DownMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addCoverBtn];
    [self addDownMenuTableView];
}

#pragma mark - TapGestureRecognizer

- (void) addCoverBtn
{
    _coverBtn = [UIButton newAutoLayoutView];
    [self.view addSubview:_coverBtn];
    _coverBtn.backgroundColor = [UIColor blackColor];
    _coverBtn.alpha = 0;
    [_coverBtn autoPinEdgesToSuperviewEdges];
    [_coverBtn addTarget:self action:@selector(dimssDownMenuTableView) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DownMenuTableViewID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DownMenuTableViewID];
        cell.backgroundColor = [UIColor clearColor];
        UIView *lineView = [UIView newAutoLayoutView];
        [cell.contentView addSubview:lineView];
        [lineView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [lineView autoSetDimension:ALDimensionHeight toSize:kLINE_1_PX];
        lineView.backgroundColor = kRGBColor(221, 221, 221, 1);
    }
    if (self.selectedIndexPath.section == indexPath.section  && self.selectedIndexPath.row == indexPath.row) {
        cell.selected = YES;
    }else{
        cell.selected = NO;
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.text = [self.dataList objectAtIndex : indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(downMenuView:DidSelectRowAtIndexpath:)]) {
        [self.delegate downMenuView:self DidSelectRowAtIndexpath:indexPath];
    }
    [self dimssDownMenuTableView];
}

#pragma mark - Method

- (void) addDownMenuTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 35;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    _downMenuTableView = tableView;
}

- (void)setReferView:(UIView *)referView
{
    _referView = referView;
    _downMenuTableView.backgroundColor = kRGBColor(241, 241, 241, 1);
    if (_isShowMenu && referView.tag == _tag) {
        [self dimssDownMenuTableView];
    }else{
        _downMenuTableView.x = referView.x;
        _downMenuTableView.size = CGSizeMake(referView.width, 0);
        _tag = referView.tag;
        [self showDownMenuTableView];
    }
}

- (void) showDownMenuTableView
{
    [UIView animateWithDuration:0.2 animations:^{
        _coverBtn.alpha = 0.2;
        _downMenuTableView.height = (!self.downMenuHeight) ? kWindowHeight * 0.5 : self.downMenuHeight;
    }completion:^(BOOL finished) {
        _isShowMenu = YES;
    }];
}

- (void) dimssDownMenuTableView
{
    [UIView animateWithDuration:0.2 animations:^{
        _coverBtn.alpha = 0;
        _downMenuTableView.height = 0;
    }completion:^(BOOL finished) {
        _isShowMenu = NO;
    }];
}

- (void)setDataList:(NSArray *)dataList
{
    _dataList = dataList;
    [_downMenuTableView reloadData];
}



@end
