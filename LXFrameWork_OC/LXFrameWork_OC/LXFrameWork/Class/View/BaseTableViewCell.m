//
//  BaseTableViewCell.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "PureLayout.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define centerCellTextFont 17.0f
#define titleTextFont 16.0f
#define detailTextFont 13.0f
#define iconSizeWH 55

@interface BaseTableViewCell ()
// 右侧的箭头图片
@property (nonatomic,strong) UIImageView *imgArrowView;
// 右侧的switch
@property (nonatomic,strong) UISwitch *rightSwitch;

@end

@implementation BaseTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.font = [UIFont systemFontOfSize:titleTextFont];
        self.detailTextLabel.font = [UIFont systemFontOfSize:detailTextFont];
    }
    return self;
}

- (void)setItems:(BaseCellItem *)items
{
    _items = items;
    // 设置cell 的数据
    [self setCellData];
    // 设置cell 右侧内容
    [self setUpAccessoryView:items];
}

- (void) setCellData
{
    // 如果是个人信息字段直接跳过设置
    if ([_items isKindOfClass:[BaseIconItem class]] || [_items isKindOfClass:[BaseCenterTitleCellItem class]]) return;
    self.textLabel.text = self.items.title;
    self.detailTextLabel.text = self.items.subTitle;
    if (!self.items.icon) return;
    self.imageView.image = [UIImage imageNamed:self.items.icon];
}

- (void) setUpAccessoryView:(BaseCellItem *)items
{
    if ([items isKindOfClass:[BaseArrowCellItem class]] || [items isKindOfClass:[BaseSubtitleCellItem class]]) { // accessoryView 箭头
        self.accessoryView = self.imgArrowView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else if ([items isKindOfClass:[BaseSwitchCellItem class]]){
        self.accessoryView = self.rightSwitch;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if ([items isKindOfClass:[BaseCenterTitleCellItem class]]){
        [self createCenterTitleCell];
    }else if ([items isKindOfClass:[BaseIconItem class]]){
        [self createIconItemCell];
    }
}

/**
 *  创建第一条显示个人消息的Cell（原型头像）
 */
- (void) createIconItemCell
{
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    // 设置头像
    UIImageView *imageView = [UIImageView newAutoLayoutView];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    [self addSubview:imageView];
    UIImage *image = [UIImage imageNamed:self.items.icon];
    if (image) {
        imageView.image = image;
    }else{
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.items.icon] placeholderImage:[UIImage imageNamed:@"user_defaultavatar"]];
    }
    imageView.layer.cornerRadius = iconSizeWH * 0.5 ;
    imageView.clipsToBounds = YES;
    imageView.userInteractionEnabled = YES;
    [imageView autoSetDimensionsToSize:CGSizeMake(iconSizeWH, iconSizeWH)];
    [imageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [imageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer:)];
    [imageView addGestureRecognizer:tap];
    // 如果点击Cell有操作，添加accessoryView
    if (_items.option) {
        self.accessoryView = self.imgArrowView;
    }
    // 根据 subTitle 添加detailTitlt位置
    if (_items.subTitle.length) {
        UILabel *title = [UILabel newAutoLayoutView];
        [self addSubview:title];
        title.textColor = [UIColor blackColor];
        title.font = [UIFont boldSystemFontOfSize:titleTextFont];
        title.text = _items.title;
        [title autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
        [title autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:imageView withOffset:18];
        
        UILabel *detailTitle = [UILabel newAutoLayoutView];
        [self addSubview:detailTitle];
        detailTitle.textColor = [UIColor grayColor];
        detailTitle.font = [UIFont boldSystemFontOfSize:detailTextFont];
        detailTitle.text = _items.subTitle;
        [detailTitle autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:imageView withOffset:18];
        [detailTitle autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:title withOffset:5];
    }else{
        UILabel *title = [UILabel newAutoLayoutView];
        [self addSubview:title];
        title.textColor = [UIColor blackColor];
        title.font = [UIFont boldSystemFontOfSize:titleTextFont];
        title.text = _items.title;
        [title autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [title autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:imageView withOffset:18];
    }
}

/**
 *  点击了个人Cell 的icon 调用
 */
- (void)tapGestureRecognizer:(UITapGestureRecognizer *) top
{
    BaseIconItem *iconItem = (BaseIconItem *) _items;
    if (iconItem.iconOption) {
        iconItem.iconOption();
    }
}

/**
 *  创建居中显示label 的Cell
 */
- (void) createCenterTitleCell
{
    BaseCenterTitleCellItem *centerCell = (BaseCenterTitleCellItem *) _items;
    UILabel *label = [UILabel newAutoLayoutView];
    [self addSubview:label];
    label.textColor = centerCell.color == nil ? [UIColor blackColor] : centerCell.color;
    label.font = [UIFont boldSystemFontOfSize:centerCellTextFont];
    label.text = centerCell.centerTitle;
    label.textAlignment = NSTextAlignmentCenter;
    [label autoSetDimensionsToSize:CGSizeMake(200, 44)];
    [label autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [label autoAlignAxisToSuperviewAxis:ALAxisVertical];
}

/**
 *  快速创建一个TableViewCell
 */
+ (instancetype)createProfileBaseCellWithTableView:(UITableView *)tableView andCellStyle:(UITableViewCellStyle)cellStyle
{
    NSString *cellStyleStr = nil;
    if (cellStyle == UITableViewCellStyleValue1) {
        cellStyleStr = @"TableViewCellValue1";
    }else if (cellStyle == UITableViewCellStyleSubtitle){
        cellStyleStr = @"TableViewCellSubtitle";
    }else if (cellStyle == UITableViewCellStyleDefault){
        cellStyleStr = @"UITableViewCellStyleDefault";
    }
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStyleStr];
    if (cell == nil) {
        cell = [[BaseTableViewCell alloc]initWithStyle:cellStyle reuseIdentifier:cellStyleStr];
    }
    return cell;
}

#pragma mark - 懒加载

- (UIImageView *)imgArrowView
{
    if (!_imgArrowView) {
        _imgArrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Arrow_Left"]];
    }
    return _imgArrowView;
}

- (UISwitch *)rightSwitch
{
    if (!_rightSwitch) {
        _rightSwitch = [[UISwitch alloc] init];
        [_rightSwitch addTarget:self  action:@selector(switchOption) forControlEvents:UIControlEventValueChanged];
    }
    return _rightSwitch;
}

/**
 *  波动开关以后调用
 */
- (void)switchOption
{
    BaseSwitchCellItem *switchItem = (BaseSwitchCellItem *) _items;
    if (switchItem.switchOption) {
        switchItem.switchOption();
    }
}

@end
