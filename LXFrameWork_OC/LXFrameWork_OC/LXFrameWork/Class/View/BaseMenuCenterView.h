//
//  BaseMenuCenterView.h
//  FrozenMall
//
//  Created by 李晓 on 16/5/5.
//  Copyright © 2016年 haier. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseMenuCenterView;

typedef enum {
    Radioselect,    // 单选
    Multiselect,    // 多选
} SelectType;

/**
 *                          使用方法
 *  BaseMenuCenterView *listView = [[BaseMenuCenterView alloc] init];
 *  listView.tag = 1;
 *  listView.title = @"选择省份";
 *  listView.delegate = self;
 *  listView.dataList = self.dataArray;
 *  [listView showView];
 */
@protocol BaseMenuCenterViewDelegate <NSObject>

/**
 *  Radioselect 单选代理方法
 */
- (void)BaseMenuCenterViewDelegate:(BaseMenuCenterView *) baseMenuCenterView didSelectAtIndexPath:(NSIndexPath *) indexPath;

/**
 *  Multiselect 多选代理方法
 *  array   [indexPath 元素][indexPath 元素]...
 */
@optional

- (void)BaseMenuCenterViewDelegate:(BaseMenuCenterView *) baseMenuCenterView didClickConfirm:(NSArray *) array;

@end


@interface BaseMenuCenterView : UIView

@property (nonatomic,assign) id<BaseMenuCenterViewDelegate> delegate;
/**
 *  弹出框标题的Title
 */
@property (nonatomic,copy) NSString *title;
/**
 *  整个弹出框的主色调
 */
@property (nonatomic,strong) UIColor *tintColor;
/**
 *  选择数据
 *  @[@"text",@"text",@"text"]
 */
@property (nonatomic,strong) NSArray *dataList;

/**
 *  创建弹出选择的 View
 *  @param selectType 弹出框的类型
 */
- (instancetype)initWithSelectType:(SelectType) selectType;

/**
 *  显示 MenuCenterView
 */
- (void) showViewOnView:(UIView *) view;
- (void) showView;

/**
 *  隐藏 MenuCenterView
 */
- (void) dismissView;

@end
