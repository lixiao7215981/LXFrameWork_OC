//
//  QRCodeViewController.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/8/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "BaseViewController.h"
@class QRCodeViewController;
/**
 *  扫描二维码
 */
@protocol QRCodeViewControllerDelegate <NSObject>

@optional

/**
 *
 *  扫描到二维码调用该代理方法
 */
- (void) ReaderCode:(QRCodeViewController *) readerViewController didScanResult:(NSString *) result;

/**
 *  用户点击了取消按钮调用
 */
- (void) ReaderCoderDidCancel:(QRCodeViewController *) readerViewController;

@end

@interface QRCodeViewController : BaseViewController

@property (nonatomic,weak) id<QRCodeViewControllerDelegate> delegate;

@end
