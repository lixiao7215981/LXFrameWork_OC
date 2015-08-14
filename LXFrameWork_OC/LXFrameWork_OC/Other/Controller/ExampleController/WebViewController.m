//
//  WebViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/8/14.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NavBar clearColor 显示按钮
    self.displayNav = YES;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://w.webbig.cn/democeshi/shuihu.html"]]];
}


@end
