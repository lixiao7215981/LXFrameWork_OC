//
//  NSMutableArray+Extension.m
//  Pods
//
//  Created by 李晓 on 16/9/18.
//
//

#import "NSMutableArray+Extension.h"

@implementation NSMutableArray (Extension)

- (NSString *)toStringSeparatedByComma
{
    NSMutableString *commaStr = [NSMutableString string];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *str = [obj stringValue];
        if (str.length) {
            [commaStr appendFormat:@"%@,",str];
        }
    }];
    if (commaStr.length > 1) {
        return [commaStr substringToIndex:commaStr.length - 1];
    }else{
        return @"";
    }
}

@end
