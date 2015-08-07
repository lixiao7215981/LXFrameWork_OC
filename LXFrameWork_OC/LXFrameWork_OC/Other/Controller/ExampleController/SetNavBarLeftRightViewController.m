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
    // 添加掩饰按钮
    [self addDemonstrateBtn];
}

- (void) addDemonstrateBtn
{
    /**
     *  设置 NavBar 左右两边图片按钮（最好不要一块设置图片和文字）
     */
    BlockButton *setImage = [BlockButton newAutoLayoutView];
    setImage.layer.cornerRadius = 5;
    setImage.clipsToBounds = YES;
    setImage.backgroundColor = [UIColor lightGrayColor];
    [setImage setTitle:@"设置为图片" forState:UIControlStateNormal];
    [setImage setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    setImage.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:setImage];
    [setImage autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [setImage autoSetDimensionsToSize:CGSizeMake(100, 30)];
    [setImage autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:90];
    setImage.ClickOption = ^{
        [self setNavTitle:@"设置为图片"];
        [self setLeftBtnWithImage:[UIImage imageNamed:@"left_sarch"] orTitle:nil ClickOption:^{
            NSLog(@"点击了左边按钮");
        }];
        
        [self setRightBtnWithImage:[UIImage imageNamed:@"right_clean"] orTitle:nil ClickOption:^{
            NSLog(@"点击了右边按钮");
        }];
    };
    
    /**
     *  设置 NavBar 左右两边的文字按钮
     */
    BlockButton *setTitle = [BlockButton newAutoLayoutView];
    setTitle.layer.cornerRadius = 5;
    setTitle.clipsToBounds = YES;
    setTitle.backgroundColor = [UIColor lightGrayColor];
    [setTitle setTitle:@"设置为文字" forState:UIControlStateNormal];
    [setTitle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    setTitle.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:setTitle];
    [setTitle autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [setTitle autoSetDimensionsToSize:CGSizeMake(100, 30)];
    [setTitle autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:setImage withOffset:25];
    setTitle.ClickOption = ^{
        [self setNavTitle:@"设置为文字"];
        [self setLeftBtnWithImage:nil orTitle:@"搜索" ClickOption:^{
            NSLog(@"点击了左边按钮");
        }];
        
        [self setRightBtnWithImage:nil orTitle:@"关闭" ClickOption:^{
            NSLog(@"点击了右边按钮");
        }];
    };
    
    /**
     *  直接设置 NavBar 左右两边的View
     */
    BlockButton *setView = [BlockButton newAutoLayoutView];
    setView.layer.cornerRadius = 5;
    setView.clipsToBounds = YES;
    setView.backgroundColor = [UIColor lightGrayColor];
    [setView setTitle:@"设置自定义View" forState:UIControlStateNormal];
    [setView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    setView.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:setView];
    [setView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [setView autoSetDimensionsToSize:CGSizeMake(120, 30)];
    [setView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:setTitle withOffset:25];
    setView.ClickOption = ^{
        [self setNavTitle:@"设置自定义View"];
        [self setLeftView:^UIView *{
            UIImageView *leftImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xiao"]];
            return leftImg;
        }];
        
        [self setRightView:^UIView *{
            UIImageView *rightImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"touxiao"]];
            return rightImg;
        }];
    };
    
    /**
     *  直接设置 NavBar 中间View
     */
    BlockButton *setCenterView = [BlockButton newAutoLayoutView];
    setCenterView.layer.cornerRadius = 5;
    setCenterView.clipsToBounds = YES;
    setCenterView.backgroundColor = [UIColor lightGrayColor];
    [setCenterView setTitle:@"设置CenterView" forState:UIControlStateNormal];
    [setCenterView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    setCenterView.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:setCenterView];
    [setCenterView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [setCenterView autoSetDimensionsToSize:CGSizeMake(120, 30)];
    [setCenterView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:setView withOffset:25];
    setCenterView.ClickOption = ^{
        // 设置返回按钮
        [self setBackBtn];
        
        [self setCenterView:^UIView *{
            UIImageView *imageView = [UIImageView newAutoLayoutView];
            imageView.image = [UIImage imageNamed:@"meishi"];
            return imageView;
        }];
    };
    
}

@end
