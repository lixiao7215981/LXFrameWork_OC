//
//  WriteViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/11/17.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import "WriteViewController.h"
#import <IQUIView+IQKeyboardToolbar.h>

@interface WriteViewController ()<SelectListViewDelegate>
{
    UIButton *_searchBtn;
}

@property (weak, nonatomic) IBOutlet UITextField *text1;

@end

@implementation WriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    SelectListView *select = [[SelectListView alloc] initWithFrame:CGRectMake(100, 100, 150, 30)];
    select.font = [UIFont systemFontOfSize:14];
    select.tableHeight = 140;
    select.delegate = self;
    select.placeholder = @"选择城市";
    select.dataList = @[@"北京",@"上海",@"广州",@"天通苑地铁站",@"深圳连明丽小区",@"西二旗铭科苑小区"];
    [self.view addSubview:select];
    
    
    
}

- (void)selectListView:(SelectListView *)selectView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
}

@end
