//
//  CodeCreateViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/9.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "CodeCreateViewController.h"
#import "StepView.h"

@interface CodeCreateViewController ()<StepViewControllerDelegate>
{
    StepView *_stepView;
}
@property (nonatomic,strong) NSMutableArray *dataList;

@end

@implementation CodeCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    NSLog(@"%@",self.view.backgroundColor);
    //    UIView *readView = [[UIView alloc] initWithFrame:CGRectMake(0 ,0 , 100, 100)];
    //    readView.backgroundColor = [UIColor redColor];
    //    [self.view addSubview:readView];
    [self.dataList addObject:@"输入手机号"];
    [self.dataList addObject:@"输入验证码"];
    [self.dataList addObject:@"设置密码"];
    
    StepView *stepView = [StepView newAutoLayoutView];
    [self.view addSubview:stepView];
    [stepView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [stepView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:64];
    stepView.delegate = self;
    _stepView = stepView;
}


- (NSArray *) titleArrayAtHeadView:(StepView *)StepView
{
    return self.dataList;
}

- (UIView *)viewForRowAtFootView:(StepView *)StepView Count:(NSInteger)number
{
    NSLog(@"%ld",number);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 500)];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 50, 50)];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    view.backgroundColor = [UIColor redColor];
    return view;
}

- (void) btnClick
{
    [_stepView nextPage];
}



- (NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [[NSMutableArray alloc] init];
    }
    return _dataList;
}

@end
