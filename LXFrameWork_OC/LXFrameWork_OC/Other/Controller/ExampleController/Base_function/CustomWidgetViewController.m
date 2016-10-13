//
//  CustomWidgetViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 16/4/27.
//  Copyright © 2016年 LXFrameWork. All rights reserved.
//

#import "CustomWidgetViewController.h"
#import "InterchangeButton.h"
#import "PullDownMenuView.h"
#import "UIColor+Extension.h"
#import "SelectListView.h"
#import "TimeButton.h"
#import "UIView+Extension.h"

// 颜色
#define kRandomColor [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0]
#define oneArray @[@"海淀区",@"东城区",@"密云区",@"昌平区",@"平谷区"]

@interface CustomWidgetViewController ()<PullDownMenuViewDelegate>
{
    UIButton *_selectBtn;
    NSInteger _tag;
}

@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (nonatomic,strong) PullDownMenuView *pullDownMenuView;
@property (weak, nonatomic) IBOutlet UIButton *pullDownBtn;
@property (weak, nonatomic) IBOutlet SelectListView *selectListView;

@end

@implementation CustomWidgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"自定义小控件"];
    
    self.selectListView.placeholder = @"selectList";
    self.selectListView.dataList = oneArray;
}

- (void)NavBackBtnClick
{
    [super NavBackBtnClick];
    [self.pullDownMenuView dismissPullDownTableView];
}

#pragma mark - Method

- (IBAction)tabBtnClick:(UIButton *)sender {
    _selectBtn.selected = NO;
    sender.selected = YES;
    _selectBtn = sender;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineView.centerX = sender.centerX;
    }];
    
    _tag = sender.tag;
    
    if (_tag == 0) {
        
    }else if (_tag == 1){
        
    }else if (_tag == 2){
        
    }else if (_tag == 3){
        
    }
}

- (IBAction)pullDownBtnClick:(UIButton *)sender {
    self.pullDownMenuView.dataList = oneArray;
    //    self.pullDownMenuView.downMenuHeight = 200;
    self.pullDownMenuView.referenceView = sender;
    [self.pullDownMenuView showPullDownTableView];
}

- (IBAction)timeButtonClick:(TimeButton *)sender {
    [sender startWithTimer:60];
    sender.backgroundColor = kRGBColor(220, 220, 220, 1);
}


#pragma mark - DownMenuViewDelegate

- (void)pullDownMenuView:(PullDownMenuView *)pullDownMenu DidSelectRowAtIndexpath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
    [self.pullDownBtn setTitle:[oneArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
}

#pragma mark - 懒加载

- (PullDownMenuView *)pullDownMenuView
{
    if (!_pullDownMenuView) {
        _pullDownMenuView = [[PullDownMenuView alloc] init];
        _pullDownMenuView.delegate = self;
    }
    return _pullDownMenuView;
}

@end
