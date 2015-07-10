//
//  BSConst.h
//  BookStore
//
//  Created by 李晓 on 14/12/24.
//  Copyright (c) 2014年 BookStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSConst : NSObject

// 监听 BSTopCollectionView 切换page页面
extern NSString * const BSTopCollectionViewChangePage;

// 购物车选中取消选中某个商品
extern NSString * const BSAddBarSelectOrDeselectClick;

// 我的收藏删除后刷新
extern NSString * const BSMineCollectRemove;

// 已购图书删除后刷新
extern NSString * const BSAlreadyByBookRemove;


@end
