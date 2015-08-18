//
//  BundleTool.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/8/10.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "BundleTool.h"

#define MYBUNDLE_NAME @ "LXFrameWork.bundle"
#define MYBUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: MYBUNDLE_NAME]
#define MYBUNDLE [NSBundle bundleWithPath: MYBUNDLE_PATH]

@implementation BundleTool

+ (UIImage *)getImageWitchName:(NSString *)name
{
    UIImage *image=[UIImage imageWithContentsOfFile:[MYBUNDLE_PATH stringByAppendingPathComponent :name]];
    return image;
}

+ (id)getViewControllerWithNibName:(NSString *)name
{
    Class vc = NSClassFromString(name);
    return [[vc alloc] initWithNibName:name bundle:MYBUNDLE];
}

+ (NSString *)getApp_Version
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

@end
