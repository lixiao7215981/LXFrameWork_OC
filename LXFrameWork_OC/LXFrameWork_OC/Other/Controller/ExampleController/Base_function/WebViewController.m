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
    
    [self setNavTitle:@"BaseWebView"];
    /**
     *   YES : NavBar clearColor 但显示NavBar上的按钮
     *    NO : NavVar 显示
     */
    self.displayNav = NO;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
}


@end
