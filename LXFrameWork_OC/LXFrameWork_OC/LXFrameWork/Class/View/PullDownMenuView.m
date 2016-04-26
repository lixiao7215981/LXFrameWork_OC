//
//  PullDownMenuView.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 16/4/26.
//  Copyright © 2016年 LXFrameWork. All rights reserved.
//

#import "PullDownMenuView.h"
#import "UIView+Extension.h"
#import "UIWindow+Extension.h"
#import "PureLayout.h"

#define kLINE_1_PX (1.0f / [UIScreen mainScreen].scale)
#define kRGBColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

static NSString * const DownTableViewID = @"DownMenuTableViewID";

@interface PullDownMenuView()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _tag;
    BOOL _isShowMenu;
}
@property (nonatomic,strong) UIButton *coverBtn;
@property (nonatomic,strong) UITableView *downTableView;

@end

@implementation PullDownMenuView

- (instancetype)init
{
    if (self) {
        self = [super init];
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.coverBtn];
        [self addDownMenuTableView];
    }
    return self;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DownTableViewID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DownTableViewID];
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
    if ([self.delegate respondsToSelector:@selector(pullDownMenuView:DidSelectRowAtIndexpath:)]) {
        [self.delegate pullDownMenuView:self DidSelectRowAtIndexpath:indexPath];
    }
    [self dismissPullDownTableView];
}

#pragma mark - Method

- (void) addDownMenuTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 35;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = kRGBColor(241, 241, 241, 1);
    [self addSubview:tableView];
    _downTableView = tableView;
}

- (void) showPullDownTableView
{
    UIWindow *window = [UIWindow getCurrentWindow];
    
    if (_isShowMenu && self.referenceView.tag == _tag) {
        [self dismissPullDownTableView];
    }else{
        CGRect rect = [self.referenceView convertRect:self.referenceView.bounds toView:window];
        CGFloat y = rect.origin.y + rect.size.height;
        self.frame = CGRectMake(0, y , window.width, window.height - y);
        self.coverBtn.frame = self.bounds;
        [self bringSubviewToFront:_downTableView];
        [window addSubview:self];
        _downTableView.x = self.referenceView.x;
        _downTableView.size = CGSizeMake(self.referenceView.width, 0);
        _tag = self.referenceView.tag;
        
        [UIView animateWithDuration:0.2 animations:^{
            _coverBtn.alpha = 0.2;
            _downTableView.height = (!self.downMenuHeight) ? window.height * 0.5 : self.downMenuHeight;
        }completion:^(BOOL finished) {
            _isShowMenu = YES;
        }];
    }
}

- (void) dismissPullDownTableView
{
    _isShowMenu = NO;
    [UIView animateWithDuration:0.2 animations:^{
        _coverBtn.alpha = 0;
        _downTableView.height = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)setDataList:(NSArray *)dataList
{
    _dataList = dataList;
    [_downTableView reloadData];
}

#pragma mark - 懒加载

- (UIButton *)coverBtn
{
    if (!_coverBtn) {
        _coverBtn = [[UIButton alloc] init];
        _coverBtn.backgroundColor = [UIColor blackColor];
        _coverBtn.alpha = 0;
        [_coverBtn addTarget:self action:@selector(dismissPullDownTableView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _coverBtn;
}

@end
