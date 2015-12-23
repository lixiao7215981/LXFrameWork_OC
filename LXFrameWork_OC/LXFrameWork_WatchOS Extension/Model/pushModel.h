//
//  pushModel.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/12/22.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface pushModel : NSObject

/**
 *  需要显示的图片的Name
 */
@property (nonatomic,copy) NSString *imageName;
/**
 *  需要显示的Label的text
 */
@property (nonatomic,copy) NSString *labelText;


+ (instancetype) createPushModelWithimage:(NSString *) imageName Andtext:(NSString *)text;

@end
