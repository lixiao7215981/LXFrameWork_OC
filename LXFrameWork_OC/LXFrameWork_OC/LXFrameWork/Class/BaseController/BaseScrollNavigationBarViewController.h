//
//  BaseScrollNavigationBarViewController.h
//  Pods
//
//  Created by 李晓 on 16/4/22.
//
//
#import "BaseViewController.h"

@interface BaseScrollNavigationBarViewController : BaseViewController

/** TableView 实时滚动展示NavigationBar */
@property (nonatomic,assign) BOOL displayNavBarWhenScroll;

/** TableView 实时滚动展示NavigationBar alpha > 0.5 的时候显示 Title 和左右按钮 */
@property (nonatomic,assign) BOOL displayNavBarElementWhenScroll;


@end
