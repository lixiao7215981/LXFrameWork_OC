//
//  BaseCenterTitleCellItem.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/6/15.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "BaseCenterTitleCellItem.h"

@implementation BaseCenterTitleCellItem

+ (instancetype)createBaseCellItemWithIcon:(NSString *)icon AndTitle:(NSString *)title SubTitle:(NSString *)subTitle ClickOption:(cellOption)option AndCenterTitle:(NSString *)centerTitle WithColor:(id)color
{
    BaseCenterTitleCellItem *centerTitleCell = [super createBaseCellItemWithIcon:title AndTitle:title SubTitle:subTitle ClickOption:option];
    centerTitleCell.centerTitle = centerTitle;
    centerTitleCell.color  = color;
    return centerTitleCell;
}

@end
