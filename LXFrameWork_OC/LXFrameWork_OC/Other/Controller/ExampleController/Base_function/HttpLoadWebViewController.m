//
//  HttpLoadWebViewController.m
//  LXFrameWork_OC
//
//  Created by Xiao.Li on 17/4/10.
//  Copyright © 2017年 LXFrameWork. All rights reserved.
//

#import "HttpLoadWebViewController.h"

@interface HttpLoadWebViewController ()

@end

@implementation HttpLoadWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavTitle:@"WebView加载百度"];
    /**
     *   YES : NavBar clearColor 但显示NavBar上的按钮
     *    NO : NavVar 显示
     */
    self.displayNav = NO;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
}



@end
