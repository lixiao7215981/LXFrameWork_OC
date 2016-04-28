//
//  SetNavBarLeftRightViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/8/7.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "SetNavBarLeftRightViewController.h"
#import "BlockButton.h"

@interface SetNavBarLeftRightViewController ()

@end

@implementation SetNavBarLeftRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"设置NavBar"];
    [self addDataList];
}

- (void) addDataList
{
    BaseArrowCellItem *item1 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"设置为图片" SubTitle:nil ClickOption:^{
        [self setNavTitle:@"设置为图片"];
        [self setLeftBtnWithImage:[UIImage imageNamed:@"left_sarch"] orTitle:nil Font:[UIFont systemFontOfSize:15] ClickOption:^{
            NSLog(@"点击了左边按钮");
        }];
        
        [self setRightBtnWithImage:[UIImage imageNamed:@"right_clean"] orTitle:nil Font:[UIFont systemFontOfSize:15] ClickOption:^{
            NSLog(@"点击了右边按钮");
        }];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item2 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"设置为文字" SubTitle:nil ClickOption:^{
        [self setNavTitle:@"设置为文字"];
        [self setLeftBtnWithImage:nil orTitle:@"搜索" Font:[UIFont systemFontOfSize:15] ClickOption:^{
            NSLog(@"点击了左边按钮");
        }];
        
        [self setRightBtnWithImage:nil orTitle:@"关闭" Font:[UIFont systemFontOfSize:15] ClickOption:^{
            NSLog(@"点击了右边按钮");
        }];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item3 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"设置自定义View" SubTitle:nil ClickOption:^{
        [self setNavTitle:@"设置自定义View"];
        UIImageView *leftImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xiao"]];
        [self setLeftView:leftImg];
        
        UIImageView *rightImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"touxiao"]];
        [self setRightView:rightImg];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item4 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"设置CenterView" SubTitle:nil ClickOption:^{
        // 设置返回按钮
        [self setNavBackBtn];
        UIImageView *imageView = [UIImageView newAutoLayoutView];
        imageView.image = [UIImage imageNamed:@"meishi"];
        [self setCenterView:imageView];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item5 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"设置多按钮" SubTitle:nil ClickOption:^{
        [self setNavTitle:@"设置多按钮"];
        
        UIImage *search = [UIImage imageNamed:@"left_sarch"];
        UIImage *clean = [UIImage imageNamed:@"right_clean"];
        
        UIButton *searchBtn = [[UIButton alloc] init];
        [searchBtn setImage:search forState:UIControlStateNormal];
        
        UIButton *cleanBtn = [[UIButton alloc] init];
        [cleanBtn setImage:clean forState:UIControlStateNormal];
        
        [self setLeftBtnArray:@[searchBtn,cleanBtn]];
        
        UIImage *search2 = [UIImage imageNamed:@"left_sarch"];
        UIImage *clean2 = [UIImage imageNamed:@"right_clean"];
        
        UIButton *searchBtn2 = [[UIButton alloc] init];
        [searchBtn2 setImage:search2 forState:UIControlStateNormal];
        
        UIButton *cleanBtn2 = [[UIButton alloc] init];
        [cleanBtn2 setImage:clean2 forState:UIControlStateNormal];
        
        UIButton *btn3 = [[UIButton alloc] init];
        [btn3 setImage:[UIImage imageNamed:@"card_icon"] forState:UIControlStateNormal];
        
        UIButton *btn4 = [[UIButton alloc] init];
        [btn4 setImage:[UIImage imageNamed:@"touxiao"] forState:UIControlStateNormal];
        
        [self setRightBtnArray:@[cleanBtn2,searchBtn2,btn3,btn4]];
    } AndDetailClass:nil];
    
    BaseCenterTitleCellItem *item6 = [BaseCenterTitleCellItem createBaseCellItemWithCenterTitle:@"复原" ClickOption:^{
        // 设置返回按钮
        [self setNavBackBtn];
        [self setNavTitle:@"设置NavBar"];
        [self setRightView:nil];
    } WithColor:kRGBColor(113, 223, 91, 1)];
    
    BaseCellItemGroup *group = [BaseCellItemGroup createGroupWithItem:@[item1,item2,item3,item4,item5,item6]];
    [self.dataList addObject:group];
}

@end
