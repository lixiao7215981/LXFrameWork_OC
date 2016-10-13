//
//  BaseLineTableViewCell.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 16/10/10.
//  Copyright © 2016年 LXFrameWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseLineTableViewCell : UITableViewCell

/**  顶部的Line   */
@property (nonatomic,strong) UIView *topLine;
/**  底部的Line   */
@property (nonatomic,strong) UIView *bottomLine;
/**  右侧更多箭头   */
@property (nonatomic,strong) UIImageView *arrowImg;
/**  顶部的Line 距离左边距   */
@property (nonatomic,assign) CGFloat topLineLeftConstraint;
/**  顶部的Line 距离右边距   */
@property (nonatomic,assign) CGFloat topLineRightConstraint;
/**  底部的Line 距离左边距   */
@property (nonatomic,assign) CGFloat bottomLineLeftConstraint;
/**  底部的Line 距离右边距   */
@property (nonatomic,assign) CGFloat bottomLineRightConstraint;

/**
 *  根据 Xib 名称创建Cell
 */
+ (instancetype)createCellWithXibName:(NSString *)xibName TableView:(UITableView *)tableView Identifier:(NSString *)identifier;

/**
 *  当前Cell 是第一个Cell
 *  将显示TopLine
 */
- (void) cellAsFirstTableCell;

/**
 *  当前Cell 是最后一个Cell
 *  将BottomLine顶头显示
 */
- (void) cellAsLastTableCell;

/**
 *  当前Cell 需要显示 ArrowImage
 *  右侧 ArrowImage显示
 */
- (void) cellAsArrowImgCell:(BOOL)isArrowCell;

/**
 *  当前Cell 需要显示 TopLine 和 BottomLine
 *  BottomLine 顶头显示
 */
- (void) cellTopBottomLineCell;




@end
