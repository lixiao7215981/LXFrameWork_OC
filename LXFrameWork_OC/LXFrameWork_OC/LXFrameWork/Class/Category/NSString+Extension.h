//
//  NSString+Extension.h
//  LiXiao
//
//  Created by 李晓 on 14-10-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)
/**
 *  根据传入的字体计算所占大小
 *
 */
- (CGSize) sizeWithFont:(UIFont *) font;
/**
 *  根据传入的字体计算所占大小
 *  width : 传入最大宽度计算出高度
 */
- (CGSize) sizeWithFont:(UIFont *)font :(CGFloat) width;

/**
 *  对 url 进行编码
 *
 */
- (NSString *)encodeToPercentEscapeString;

/**
 *  对 url 进行解码
 *
 */
- (NSString *)decodeFromPercentEscapeString;

/**
 *  获取设备沙盒路径
 */
+ (NSString *)applicationDocumentsDirectory;

- (NSString *)dateStringFromtYYYYMMDD;

@end
