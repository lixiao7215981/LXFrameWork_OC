//
//  StepNextView.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/15.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Option)();
@interface StepNextView : UIView

@property (nonatomic,strong) NSDictionary *params;

@property (nonatomic, copy) Option option;

@end
