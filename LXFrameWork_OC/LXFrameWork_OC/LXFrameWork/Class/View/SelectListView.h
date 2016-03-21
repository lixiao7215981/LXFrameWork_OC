//
//  SelectListView.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 16/3/21.
//  Copyright © 2016年 LXFrameWork. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SelectListView;

@protocol SelectListViewDelegate <NSObject>
@optional

- (void) selectListView:(SelectListView *)selectView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface SelectListView : UIView

@property (nonatomic,weak) id <SelectListViewDelegate> delegate;

/***  tableViewHeight 默认 H = 130 */
@property (nonatomic,assign) CGFloat tableHeight;
/***  字体大小 */
@property (nonatomic,strong) UIFont *font;
/***  占位文字 */
@property (nonatomic,copy) NSString *placeholder;
/***  数据源 */
@property (nonatomic,strong) NSArray *dataList;

@end
