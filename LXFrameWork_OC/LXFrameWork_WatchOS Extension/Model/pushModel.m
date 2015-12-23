//
//  pushModel.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/12/22.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import "pushModel.h"

@implementation pushModel

+(instancetype)createPushModelWithimage:(NSString *)imageName Andtext:(NSString *)text
{
    pushModel *model = [[self alloc] init];
    model.imageName = imageName;
    model.labelText = text;
    return model;
}

@end
