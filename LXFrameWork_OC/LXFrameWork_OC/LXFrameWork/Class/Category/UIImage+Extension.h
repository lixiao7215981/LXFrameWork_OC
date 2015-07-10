//
//  UIImage+Extension.h
//  BookStore
//
//  Created by 李晓 on 15/7/1.
//  Copyright (c) 2015年 BookStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
- (UIImage *)subImageInRect:(CGRect)rect;
- (UIImage *)scaleToSize:(CGSize)size;
- (UIImage *)imageScaleAspectFillFromTop:(CGSize)frameSize;
- (UIImage *)imageFillSize:(CGSize)viewsize;
- (UIImage *)scaleAndRotateImage;

- (UIImage *)resizeCanvas:(CGSize)sz alignment:(int)alignment;

+ (UIImage *)imageWithColor:(UIColor *)color;   // 生成纯色的图片
+ (UIImage *)imageWithColor:(UIColor *)color WithSize:(CGSize)size;   // 根据传入大小生成纯色的图片

@end
