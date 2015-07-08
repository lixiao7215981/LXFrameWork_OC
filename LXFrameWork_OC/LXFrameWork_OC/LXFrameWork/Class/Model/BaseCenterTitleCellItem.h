//
//  BaseCenterTitleCellItem.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/6/15.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "BaseCellItem.h"
#import <UIKit/UIKit.h>

@interface BaseCenterTitleCellItem : BaseCellItem

@property (nonatomic,copy) NSString *centerTitle;

@property (nonatomic,strong) UIColor *color;

+(instancetype)createBaseCellItemWithIcon:(NSString *) icon AndTitle:(NSString *)title SubTitle:(NSString *) subTitle ClickOption:(cellOption) option AndCenterTitle:(NSString *) centerTitle WithColor:(UIColor *) color;

@end
