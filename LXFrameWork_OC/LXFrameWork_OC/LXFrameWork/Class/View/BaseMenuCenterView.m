//
//  BaseMenuCenterView.m
//  FrozenMall
//
//  Created by 李晓 on 16/5/5.
//  Copyright © 2016年 haier. All rights reserved.
//

#import "BaseMenuCenterView.h"

#define defaultTintColor kRGBColor(38, 123, 223, 1)
#define defaultCellSelectedImage @"Cart_home_roundBtn_selected"
#define defaultCellNormalImage  @"Cart_home_roundBtn_normal"

static NSString * const BaseMenuCenterViewCellID = @"BaseMenuCenterViewCellID";

@interface BaseMenuCenterView()<UITableViewDelegate,UITableViewDataSource>
{
    UIView  *_topView;
    UIView  *_bottomView;
    UILabel *_titleLabel;
}
@property (nonatomic,strong) UIButton *coverBtn;
@property (nonatomic,assign) SelectType selectType;
@property (nonatomic,strong) NSMutableDictionary *selectDict;

@end

@implementation BaseMenuCenterView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addTopView];
        [self addBottomView];
        [self addSelectTableView];
        
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (instancetype)initWithSelectType:(SelectType) selectType
{
    _selectType = selectType;
    self = [self init];
    return self;
}

- (void) addTopView
{
    _topView = [UIView newAutoLayoutView];
    [self addSubview:_topView];
    [_topView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
    [_topView autoSetDimension:ALDimensionHeight toSize:30];
    _topView.backgroundColor = _tintColor? _tintColor : defaultTintColor ;
    
    _titleLabel = [UILabel newAutoLayoutView];
    [_topView addSubview:_titleLabel];
    [_titleLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    _titleLabel.font = [UIFont systemFontOfSize:13];
    _titleLabel.textColor = [UIColor whiteColor];
}

- (void) addBottomView
{
    if (self.selectType == Radioselect) return;
    _bottomView = [UIView newAutoLayoutView];
    [self addSubview:_bottomView];
    [_bottomView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [_bottomView autoSetDimension:ALDimensionHeight toSize:30];
    _bottomView.backgroundColor = _tintColor? _tintColor : defaultTintColor ;
    
    UIButton *cleanBtn = [UIButton newAutoLayoutView];
    cleanBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [cleanBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cleanBtn addTarget:self action:@selector(coverBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView addSubview:cleanBtn];
    UIButton *enterBtn = [UIButton newAutoLayoutView];
    enterBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [enterBtn setTitle:@"确认" forState:UIControlStateNormal];
    [enterBtn addTarget:self action:@selector(enterBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView addSubview:enterBtn];
    [cleanBtn autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeRight];
    [enterBtn autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeLeft];
    [cleanBtn autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:enterBtn];
    [cleanBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:enterBtn];
    
    UIView *lineView = [UIView newAutoLayoutView];
    [_bottomView addSubview:lineView];
    lineView.backgroundColor = [UIColor whiteColor];
    [lineView autoSetDimension:ALDimensionWidth toSize:1];
    [lineView autoPinEdgeToSuperviewMargin:ALEdgeTop];
    [lineView autoPinEdgeToSuperviewMargin:ALEdgeBottom];
    [lineView autoAlignAxisToSuperviewAxis:ALAxisVertical];
}

- (void) addSelectTableView
{
    UITableView *tableView = [UITableView newAutoLayoutView];
    [self addSubview:tableView];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [tableView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [tableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_topView];
    if (self.selectType == Radioselect) {
        [tableView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    }else if(self.selectType == Multiselect){
        [tableView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_bottomView];
    }
    
    tableView.delegate = self;
    tableView.dataSource = self;
}

- (void) enterBtnClick
{
    if (self.selectDict.count){
        if ([self.delegate respondsToSelector:@selector(BaseMenuCenterViewDelegate:didClickConfirm:)]) {
            [self.delegate BaseMenuCenterViewDelegate:self didClickConfirm:[self.selectDict allValues]];
        }
    }
    [self dismissView];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = title;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BaseMenuCenterViewCellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BaseMenuCenterViewCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView *line = [UIView newAutoLayoutView];
        [cell.contentView addSubview:line];
        [line autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [line autoSetDimension:ALDimensionHeight toSize:0.5];
        line.backgroundColor = kLINE_Back_Color;
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.textColor = kRGBColor(50, 50, 50, 1);
        if (self.selectType == Radioselect) {
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.imageView.image = nil;
        }else if(self.selectType == Multiselect){
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
        }
    }
    if(self.selectType == Multiselect){
        if([self.selectDict objectForKey:indexPath]){
            cell.imageView.image = [UIImage imageNamed:defaultCellSelectedImage];
        }else{
            cell.imageView.image = [UIImage imageNamed:defaultCellNormalImage];
        }
    }
    cell.textLabel.text = [self.dataList objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectType == Radioselect) {
        if ([self.delegate respondsToSelector:@selector(BaseMenuCenterViewDelegate:didSelectAtIndexPath:)]) {
            [self.delegate BaseMenuCenterViewDelegate:self didSelectAtIndexPath:indexPath];
            [self dismissView];
        }
    }else if(self.selectType == Multiselect){
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if([self.selectDict objectForKey:indexPath]){
            [self.selectDict removeObjectForKey:indexPath];
            cell.imageView.image = [UIImage imageNamed:defaultCellNormalImage];
        }else{
            [self.selectDict setObject:indexPath forKey:indexPath];
            cell.imageView.image = [UIImage imageNamed:defaultCellSelectedImage];
        }
    }
}

#pragma mark - Method

- (void) showView
{
    UIWindow *window = [UIWindow getCurrentWindow];
    self.coverBtn.alpha = 0;
    self.alpha = 0;
    [window addSubview:self.coverBtn];
    [window addSubview:self];
    [_coverBtn autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    [self autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    CGFloat height = 200;
    if (self.dataList.count > 5 ) {
        height = kWindowHeight * 0.5;
    }
    [self autoSetDimensionsToSize:CGSizeMake(kWindowWidth * 0.5, height)];
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1;
        self.coverBtn.alpha = 0.3;
    }];
}

- (void) dismissView
{
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
        self.coverBtn.alpha = 0;
    } completion:^(BOOL finished) {
        [self.coverBtn removeFromSuperview];
        [self removeFromSuperview];
    }];
}

- (void)coverBtnClick
{
    [self dismissView];
}

#pragma mark - 懒加载

- (UIButton *)coverBtn
{
    if (!_coverBtn) {
        _coverBtn = [UIButton newAutoLayoutView];
        _coverBtn.backgroundColor = [UIColor blackColor];
        [_coverBtn addTarget:self action:@selector(coverBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _coverBtn;
}

- (NSMutableDictionary *)selectDict
{
    if (!_selectDict) {
        _selectDict = [[NSMutableDictionary alloc] init];
    }
    return _selectDict;
}

@end
