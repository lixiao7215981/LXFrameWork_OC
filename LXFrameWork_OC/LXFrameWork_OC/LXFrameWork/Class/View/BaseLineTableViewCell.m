//
//  BaseLIneTableViewCell.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 16/10/10.
//  Copyright © 2016年 LXFrameWork. All rights reserved.
//

#import "BaseLineTableViewCell.h"
#import "PureLayout.h"
#import "BundleTool.h"

@interface BaseLineTableViewCell()

@property (nonatomic,strong) NSLayoutConstraint *topLineLeft;
@property (nonatomic,strong) NSLayoutConstraint *topLineRight;
@property (nonatomic,strong) NSLayoutConstraint *bottomLineLeft;
@property (nonatomic,strong) NSLayoutConstraint *bottomLineRight;

@end

@implementation BaseLineTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addToplineBottomLine];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self addToplineBottomLine];
    return self;
}

/**
 *  根据 Xib 名称创建Cell
 */
+ (instancetype)createCellWithXibName:(NSString *)xibName TableView:(UITableView *)tableView Identifier:(NSString *)identifier
{
    BaseLineTableViewCell *tableViewcell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!tableViewcell) {
        if (xibName.length) {
            tableViewcell = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil]lastObject];
        }else{
            tableViewcell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
    }
    tableViewcell.textLabel.font = [UIFont systemFontOfSize:14];
    tableViewcell.textLabel.backgroundColor = [UIColor clearColor];
    // topLine 默认不显示
    tableViewcell.topLine.hidden = YES;
    // arrowImage 默认显示
    tableViewcell.arrowImg.hidden = NO;
    // 底部BottomLine距离左边距默认20px
    tableViewcell.bottomLineLeft.constant = 20;
    return tableViewcell;
}

- (void) addToplineBottomLine
{
    UIView *topLine = [UIView newAutoLayoutView];
    _topLine = topLine;
    [self.contentView addSubview:topLine];
    NSArray *top_array = [topLine autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
    _topLineLeft = top_array.count >= 1 ? top_array[0] : nil;
    _topLineRight = top_array.count >= 1 ? [top_array lastObject] :nil;
    [topLine autoSetDimension:ALDimensionHeight toSize:kLINE_1_PX];
    topLine.backgroundColor = kLINE_Back_Color;
    
    UIView *bottomLine = [UIView newAutoLayoutView];
    _bottomLine = bottomLine;
    [self.contentView addSubview:bottomLine];
    NSArray *bottom_array = [bottomLine autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
    _bottomLineLeft = bottom_array.count >= 1 ? bottom_array[0] : nil;
    _bottomLineRight = bottom_array.count >= 1 ? [bottom_array lastObject] :nil;
    [bottomLine autoSetDimension:ALDimensionHeight toSize:kLINE_1_PX];
    bottomLine.backgroundColor = kLINE_Back_Color;
    
    UIImageView *arrowImg = [UIImageView newAutoLayoutView];
    _arrowImg = arrowImg;
    arrowImg.image = [BundleTool getImage:@"Arrow_Right" FromBundle:LXFrameWorkBundle];
    [self.contentView addSubview:arrowImg];
    [arrowImg autoSetDimensionsToSize:CGSizeMake(8, 12)];
    [arrowImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [arrowImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
}

- (void)setTopLineLeftConstraint:(CGFloat)topLineLeftConstraint
{
    _topLineLeftConstraint = topLineLeftConstraint;
    self.topLineLeft.constant = topLineLeftConstraint;
}

- (void)setBottomLineLeftConstraint:(CGFloat)bottomLineLeftConstraint
{
    _bottomLineLeftConstraint = bottomLineLeftConstraint;
    self.bottomLineLeft.constant = bottomLineLeftConstraint;
}

- (void)setTopLineRightConstraint:(CGFloat)topLineRightConstraint
{
    _topLineRightConstraint = topLineRightConstraint;
    self.topLineRight.constant = topLineRightConstraint;
}

- (void)setBottomLineRightConstraint:(CGFloat)bottomLineRightConstraint
{
    _bottomLineRightConstraint = bottomLineRightConstraint;
    self.bottomLineRight.constant = bottomLineRightConstraint;
}

#pragma mark - Method

- (void)cellAsFirstTableCell
{
    if (_topLine) {
        self.topLine.hidden = NO;
    }
}

- (void)cellAsLastTableCell
{
    if (_bottomLine) {
        self.bottomLineLeft.constant = 0;
    }
}

- (void)cellAsArrowImgCell:(BOOL)isArrowCell
{
    if (_arrowImg) {
        _arrowImg.hidden = !isArrowCell;
    }
}

- (void)cellTopBottomLineCell
{
    [self cellAsFirstTableCell];
    [self cellAsLastTableCell];
}

@end
