//
//  BaseCellItem.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/6/15.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^cellOption)();

@interface BaseCellItem : NSObject

@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subTitle;

/* block 保存一段代码在用到的时候执行 */
@property (nonatomic,copy) cellOption option;

+(instancetype)createBaseCellItemWithIcon:(NSString *) icon AndTitle:(NSString *)title SubTitle:(NSString *) subTitle ClickOption:(cellOption) option;

@end
