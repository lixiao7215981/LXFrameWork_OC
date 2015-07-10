//
//  PlistTool.h
//  LiXiao
//
//  Created by 李晓 on 15/7/2.
//  Copyright (c) 2015年 BookStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistTool : NSObject

+ (NSArray *)loadPlistWithName:(NSString *) name AndType:(NSString *)type;


+ (NSArray *) loadTabBarCenterViewWithName:(NSString *) name;

@end
