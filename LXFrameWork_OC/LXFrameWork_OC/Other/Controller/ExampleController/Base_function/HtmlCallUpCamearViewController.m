//
//  HtmlCallUpCamearViewController.m
//  LXFrameWork_OC
//
//  Created by Xiao.Li on 17/4/10.
//  Copyright © 2017年 LXFrameWork. All rights reserved.
//

#import "HtmlCallUpCamearViewController.h"

@interface HtmlCallUpCamearViewController ()

@end

@implementation HtmlCallUpCamearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavTitle:@"Html5 调用相机／相册"];
    /**
     *   YES : NavBar clearColor 但显示NavBar上的按钮
     *    NO : NavVar 显示
     */
    self.displayNav = NO;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HtmlCallUpSystemCamera" ofType:@"html"];
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
    [self.webView loadRequest:request];
}

@end
