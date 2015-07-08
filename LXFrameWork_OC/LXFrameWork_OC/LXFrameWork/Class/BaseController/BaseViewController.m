//
//  BaseViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "BaseViewController.h"
#import "PureLayout.h"
@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar removeFromSuperview];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 64)];
    view.backgroundColor = [UIColor redColor];
    _nav = view;
    [self.view insertSubview:view atIndex:0];

}



@end
