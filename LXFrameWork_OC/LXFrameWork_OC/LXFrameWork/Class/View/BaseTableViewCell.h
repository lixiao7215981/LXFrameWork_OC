//
//  BaseTableViewCell.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCellItem.h"
#import "BaseArrowCellItem.h"
#import "BaseCenterTitleCellItem.h"
#import "BaseSwitchCellItem.h"

@interface BaseTableViewCell : UITableViewCell

/**
 *  数据Modal
 */
@property (nonatomic,strong) BaseCellItem *items;
/**
 *  快速创建Cell
 *
 */
+ (instancetype) createProfileBaseCellWithTableView:(UITableView *)tableView andCellStyle:(UITableViewCellStyle) cellStyle;



@end
