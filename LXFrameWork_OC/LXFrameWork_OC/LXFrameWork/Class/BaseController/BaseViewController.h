//
//  BaseViewController.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"
#import "BlockButton.h"

@interface BaseViewController : UIViewController

typedef UIView* (^ViewBlock)();

@property (nonatomic,strong) NavigationBar *navView;

/**
 *  设置左边View
 */
- (void)setLeftView:(ViewBlock) leftViewBlock ;

/**
 *  设置邮编View
 */
- (void)setRightView:(ViewBlock) rightViewBlock ;

/**
 *  设置左边View
 */
- (void)setCenterView:(ViewBlock) centerViewBlock ;

/**
 *  设置navigationBar 返回按钮
 */
- (UIButton *) setBackBtn;

/**
 *  设置 NavigationController Title
 *
 */
- (UILabel *) setTitle:(NSString *) title;

/**
 *  设置leftBtn
 */
- (UIButton *) setLeftBtnWithImage:(UIImage *)image orTitle:(NSString *) title ClickOption:(ClickButton) clickOption ;

/**
 *  设置rightBtn
 */
- (UIButton *) setRightBtnWithImage:(UIImage *)image orTitle:(NSString *) title ClickOption:(ClickButton) clickOption ;



@end
