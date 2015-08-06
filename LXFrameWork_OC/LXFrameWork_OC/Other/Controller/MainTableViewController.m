//
//  MainTableViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/8/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "MainTableViewController.h"
#import "QRCodeViewController.h"

@interface MainTableViewController ()<QRCodeViewControllerDelegate>

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addDataList];
    [self setNavTitle:@"LXFrameWork_OC"];
}

- (void) addDataList
{
    __weak typeof(self) Main = self;
    BaseArrowCellItem *item1 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"二维码" SubTitle:nil ClickOption:^{
        QRCodeViewController *readCode = [[QRCodeViewController alloc] init];
        readCode.delegate = Main;
        [self.navigationController presentViewController:readCode animated:YES completion:nil];
    } AndDetailClass:nil];
    
    BaseCellItemGroup *group1 = [BaseCellItemGroup createGroupWithItem:@[item1]];
    
    [self.dataList addObject:group1];
}

- (void)ReaderCode:(QRCodeViewController *)readerViewController didScanResult:(NSString *)result
{
    NSLog(@"%@",result);
}

- (void)ReaderCoderDidCancel:(QRCodeViewController *)readerViewController
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


@end
