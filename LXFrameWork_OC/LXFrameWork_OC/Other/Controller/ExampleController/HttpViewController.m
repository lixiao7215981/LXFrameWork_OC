//
//  HttpViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/8/10.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "HttpViewController.h"
#import "NSString+Extension.h"
#import "HttpTool.h"

@interface HttpViewController ()

@end

@implementation HttpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"发送请求"];
    [self addDataList];
}

- (void) addDataList
{
    BaseArrowCellItem *item1 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"发送请求" SubTitle:nil ClickOption:^{
        NSLog(@"%@",[NSString applicationDocumentsDirectory]);
        [HttpTool HttpToolGetWithUrl:@"http://www.baidu.com" paramesers:@{@"1":@"好痛好痛"} Success:^(id json) {
            NSLog(@"成功");
        } failure:^(NSError *error) {
            NSLog(@"失败");
        }];
        
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item2 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"发送请求" SubTitle:nil ClickOption:^{
        [HttpTool HttpToolGetWithUrl:@"http://www.baidu.com" paramesers:nil Success:^(id json) {
            NSLog(@"成功");
        } failure:^(NSError *error) {
            NSLog(@"失败");
        }];
        
    } AndDetailClass:nil];
    
    BaseCellItemGroup *group = [BaseCellItemGroup createGroupWithItem:@[item1,item2]];
    
    [self.dataList addObject:group];
}

@end
