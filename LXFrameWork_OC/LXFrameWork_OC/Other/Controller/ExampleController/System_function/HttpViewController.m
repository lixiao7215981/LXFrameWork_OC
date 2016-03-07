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
    BaseArrowCellItem *item1 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"发送POST请求" SubTitle:nil ClickOption:^{
        
        //        [HttpTool HttpToolPostWithUrl:@"http://hzd.skyware.com.cn/api/Newestversion" paramesers:@{@"1":@{@"100":@"里边的1",@"101":@"里边的2"},@"2":@[@"1",@"2",@"3",@"4",@"5"],@"3":@"好痛好痛",@"4":@"好痛好痛",@"5":@"好痛好痛",@"6":@"好痛好痛",@"7":@"好痛好痛",@"8":@"好痛好痛",@"9":@"好痛好痛",@"10":@"好痛好痛"} Success:^(id json) {
        //            NSLog(@"成功---%@",json);
        //        } failure:^(NSError *error) {
        //            NSLog(@"失败---%@",error);
        //        }];
        
        NSURLSessionDataTask *task =  [HttpTool HttpToolPostWithUrl:@"http://hzd.skyware.com.cn/api/Newestversion" paramesers:@{@"1":@{@"100":@"里边的1",@"101":@"里边的2"},@"2":@[@"1",@"2",@"3",@"4",@"5"],@"3":@"好痛好痛",@"4":@"好痛好痛",@"5":@"好痛好痛",@"6":@"好痛好痛",@"7":@"好痛好痛",@"8":@"好痛好痛",@"9":@"好痛好痛",@"10":@"好痛好痛"} requestHeaderField:@{@"1":@"好痛好痛",@"2":@"好痛好痛",@"3":@"好痛好痛",@"4":@"好痛好痛",@"5":@"好痛好痛",@"6":@"好痛好痛",@"7":@"好痛好痛",@"8":@"好痛好痛",@"9":@"好痛好痛",@"10":@"好痛好痛"} Serializer:JSONResponseSerializer Success:^(id json) {
            NSLog(@"成功---%@",json);
        } failure:^(NSError *error) {
            NSLog(@"失败---%@",error);
        }];
        [task cancel];
        
        NSData *data = UIImagePNGRepresentation([UIImage imageNamed:@"exception_success"]);
        [HttpTool HttpToolPostWithUrl:@"http://hzd.skyware.com.cn/api/Newestversion" paramesers:@{@"9":@"好痛好痛",@"10":@"好痛好痛"} Data:data Name:@"image_file" FileName:@"file" MainType:@"text/png" Success:^(id json) {
            NSLog(@"成功---%@",json);
        } failure:^(NSError *error) {
            NSLog(@"失败---%@",error);
        }];
        
        
        
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item2 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"发送GET请求" SubTitle:nil ClickOption:^{
        
        //        [HttpTool HttpToolGetWithUrl:@"http://hzd.skyware.com.cn/api/Newestversionhttp://hzd.skyware.com.cn/api/Newestversion" paramesers:nil Success:^(id json) {
        //            NSLog(@"成功---%@",json);
        //        } failure:^(NSError *error) {
        //            NSLog(@"失败---%@",error);
        //        }];
        
        [HttpTool HttpToolGetWithUrl:@"http://hzd.skyware.com.cn/api/Newestversion" paramesers:@{@"1":@{@"100":@"里边的1",@"101":@"里边的2"},@"2":@[@"1",@"2",@"3",@"4",@"5"],@"3":@"好痛好痛",@"4":@"好痛好痛",@"5":@"好痛好痛",@"6":@"好痛好痛",@"7":@"好痛好痛",@"8":@"好痛好痛",@"9":@"好痛好痛",@"10":@"好痛好痛"} requestHeaderField:@{@"1":@"好痛好痛",@"2":@"好痛好痛",@"3":@"好痛好痛",@"4":@"好痛好痛",@"5":@"好痛好痛",@"6":@"好痛好痛",@"7":@"好痛好痛",@"8":@"好痛好痛",@"9":@"好痛好痛",@"10":@"好痛好痛"} Serializer:JSONResponseSerializer Success:^(id json) {
            NSLog(@"成功---%@",json);
        } failure:^(NSError *error) {
            NSLog(@"失败---%@",error);
        }];
        
        
    } AndDetailClass:nil];
    
    BaseCellItemGroup *group = [BaseCellItemGroup createGroupWithHeadTitle:@"模拟发送请求" AndFooterTitle:nil OrItem:@[item1,item2]];
    
    [self.dataList addObject:group];
}

@end
