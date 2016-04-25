//
//  DownMenuViewController.h
//  FrozenMall
//
//  Created by 李晓 on 16/4/24.
//  Copyright © 2016年 haier. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DownMenuViewController;

@protocol DownMenuViewDelegate <NSObject>
@optional

- (void) downMenuView:(DownMenuViewController *)downMenuVC DidSelectRowAtIndexpath:(NSIndexPath *)indexPath;

@end

@interface DownMenuViewController : UIViewController

/**
 *  显示TableVIew 参照View
 */
@property (nonatomic,strong) UIView *referView;
/**
 *  DownMenuViewDataSource
 */
@property (nonatomic,strong) NSArray *dataList;
/**
 *  DownMenu Cell Height
 */
@property (nonatomic,assign) CGFloat downMenuHeight;
/**
 *  选中的 IndexPath
 */
@property (nonatomic,strong) NSIndexPath *selectedIndexPath;
/**
 *  DownMenuViewController 的代理
 */
@property (nonatomic,weak) id<DownMenuViewDelegate> delegate;

/**
 *  显示 DownMenu （默认不用调用，设置 referView 之后会自动调用）
 */
- (void) showDownMenuTableView;
/**
 *  隐藏 DownMenu
 */
- (void) dimssDownMenuTableView;

@end
