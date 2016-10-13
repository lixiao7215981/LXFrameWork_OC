//
//  NSMutableArray+Extension.h
//  Pods
//
//  Created by 李晓 on 16/9/18.
//
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Extension)

/**
 *  将数组中元素按照 “,” 分割成字符串
 *  支持 string int  double 等基础数据类型
 *  @[1,2,3]
 *  @return @“1,2,3”
 */
- (NSString *) toStringSeparatedByComma;

@end
