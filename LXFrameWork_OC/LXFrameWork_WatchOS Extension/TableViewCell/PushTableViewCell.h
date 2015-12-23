//
//  PushTableViewCell.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/12/22.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface PushTableViewCell : NSObject

/**
 *  Cell 显示的图片
 */
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *cellImage;
/**
 *  Cell 显示的名称
 */
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *cellLabel;


@end
