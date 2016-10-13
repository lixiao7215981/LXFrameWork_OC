//
//  UserDefaultsTool.m
//  HangingFurnace
//
//  Created by 李晓 on 15/9/11.
//  Copyright (c) 2015年 skyware. All rights reserved.
//

#import "UserDefaultsTool.h"

@implementation UserDefaultsTool

static NSUserDefaults *_Udefaults;

+ (void)initialize
{
    _Udefaults = [NSUserDefaults standardUserDefaults];
}

+ (void) setUserDefaultsWith:(id) obj forKey:(NSString *) key
{
    [_Udefaults setObject:obj forKey:key];
    [_Udefaults synchronize];
}

+ (id) getUserDefaultsForKey:(NSString *) key
{
    return [_Udefaults objectForKey:key];
}

+ (void)removeUserDefaultsForKey:(NSString *)key
{
    [_Udefaults removeObjectForKey:key];
    [_Udefaults synchronize];
}

@end
