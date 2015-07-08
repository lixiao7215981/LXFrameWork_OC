//
//  BaseTableViewCell.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "PureLayout.h"

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
        self.textLabel.font = [UIFont systemFontOfSize:15];
        self.detailTextLabel.font = [UIFont systemFontOfSize:13];
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
    self.textLabel.text = self.items.title;
    self.detailTextLabel.text = self.items.subTitle;
    if (!self.items.icon) return;
    self.imageView.image = [UIImage imageNamed:self.items.icon];
}

- (void) setUpAccessoryView:(BaseCellItem *)items
{
    if ([items isKindOfClass:[BaseArrowCellItem class]]) { // accessoryView 箭头
        self.accessoryView = self.imgArrowView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else if ([items isKindOfClass:[BaseSwitchCellItem class]]){
        self.accessoryView = self.rightSwitch;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if ([items isKindOfClass:[BaseCenterTitleCellItem class]]){
        BaseCenterTitleCellItem *centerCell = (BaseCenterTitleCellItem *) items;
        UILabel *label = [UILabel newAutoLayoutView];
        label.textColor = centerCell.color == nil ? [UIColor blackColor] : centerCell.color;
        label.font = [UIFont boldSystemFontOfSize:17];
        label.text = centerCell.centerTitle;
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        [label autoSetDimensionsToSize:CGSizeMake(200, 44)];
        [label autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [label autoAlignAxisToSuperviewAxis:ALAxisVertical];
    }
}

+ (instancetype)createProfileBaseCellWithTableView:(UITableView *)tableView andCellStyle:(UITableViewCellStyle)cellStyle
{
    NSString *cellStyleStr = nil;
    if (cellStyle == UITableViewCellStyleValue1) {
        cellStyleStr = @"TableViewCellValue1";
    }else if (cellStyle == UITableViewCellStyleSubtitle){
        cellStyleStr = @"TableViewCellSubtitle";
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

- (void)switchOption
{
    BaseSwitchCellItem *switchItem = (BaseSwitchCellItem *) _items;
    if (switchItem.switchOption) {
        switchItem.switchOption();
    }
}

@end
