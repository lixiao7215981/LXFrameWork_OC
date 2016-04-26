//
//  PullDownMenuView.h
//  LXFrameWork_OC
//
//  Created by 李晓 on 16/4/26.
//  Copyright © 2016年 LXFrameWork. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PullDownMenuView;

@protocol PullDownMenuViewDelegate <NSObject>
@optional

- (void) pullDownMenuView:(PullDownMenuView *)pullDownMenu DidSelectRowAtIndexpath:(NSIndexPath *)indexPath;

@end

@interface PullDownMenuView : UIView

/**
 *  显示位置 参照View
 */
@property (nonatomic,strong) UIView *referenceView;
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
@property (nonatomic,weak) id<PullDownMenuViewDelegate> delegate;


#pragma mark - Method
/**
 *  显示下拉菜单列表
 */
- (void) showPullDownTableView;
/**
 *  隐藏下拉菜单列表
 */
- (void) dismissPullDownTableView;

@end
