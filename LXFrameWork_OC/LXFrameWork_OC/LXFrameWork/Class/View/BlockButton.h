//
//  BlockButton.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/8.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockButton : UIButton

typedef void (^ClickButton)();

@property (nonatomic,copy) ClickButton ClickOption;

@end
