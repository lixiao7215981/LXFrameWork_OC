//
//  MenuViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/12/22.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // 在 Storyboard 中添加了两个 MenuItem  手动添加了一个
    
    // 手动添加MenuItem
    [self addMenuItemWithItemIcon:WKMenuItemIconBlock title:@"禁止" action:@selector(clickblockBtn)];
    
    /**
     *  还有如下方法可以添加MenuItem
     *  [self addMenuItemWithImageNamed:nil title:nil action:nil];
     *  [self addMenuItemWithImage:nil title:nil action:nil];
     */
}

- (void)willActivate {
    [super willActivate];
}

- (void)didDeactivate {
    [super didDeactivate];
}

#pragma mark - Menu展示

- (IBAction)clickAddBtn {
    NSLog(@"点击了添加按钮");
}

- (IBAction)clickRemoveBtn {
    NSLog(@"点击了删除按钮");
}

- (void) clickblockBtn{
    NSLog(@"点击了显示按钮");
}



@end



