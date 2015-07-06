//
//  BaseCenterTitleCellItem.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/6/15.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "BaseCellItem.h"

@interface BaseCenterTitleCellItem : BaseCellItem

@property (nonatomic,copy) NSString *centerTitle;

+(instancetype)createBaseCellItemWithIcon:(NSString *) icon AndTitle:(NSString *)title SubTitle:(NSString *) subTitle ClickOption:(cellOption) option AndCenterTitle:(NSString *) centerTitle;

@end
