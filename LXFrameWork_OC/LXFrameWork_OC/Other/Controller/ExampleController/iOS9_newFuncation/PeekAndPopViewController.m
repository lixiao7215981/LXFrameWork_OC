//
//  PeekAndPopViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/11/21.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import "PeekAndPopViewController.h"
#import "CustomQRCodeViewController.h"
#import "UIWindow+Extension.h"
#import "PeekAndPopTableViewCell.h"
#import <SVProgressHUD.h>

@interface PeekAndPopViewController ()<UIViewControllerPreviewingDelegate,UITableViewDelegate>
{
    CGRect _highilghtRowFrame;
}
@end

@implementation PeekAndPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"peek and pop"];
    self.tableView.separatorStyle = UITableViewScrollPositionNone;
    
    // 添加数据
    [self addDataList];
    
    //注册3D Touch,先判断是否可用
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0") && (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)){
        // 注册支持 3D-touch 的View
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
    }else{
        [SVProgressHUD showErrorWithStatus:@"请使用支持3D-touch的设备"];
    }
}

- (void) addDataList
{
    BaseCellItemGroup *group = [[BaseCellItemGroup alloc] init];
    for (int i = 0; i < 30; i++) {
        BaseCellItem *item = [BaseCellItem createBaseCellItemWithIcon:nil AndTitle:[NSString stringWithFormat:@"我叫%d  我是打酱油的",i+1] SubTitle:nil ClickOption:nil];
        [group addObjectWith:item];
    }
    [self.dataList addObject:group];
    [self.tableView reloadData];
}

#pragma mark - UIViewControllerPreviewingDelegate

- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    
    NSLog(@"Touch-Point = %@",NSStringFromCGPoint(location));
    
    
    CustomQRCodeViewController *childVC = [[CustomQRCodeViewController alloc] init];
    //        childVC.preferredContentSize = CGSizeMake(320.0f,300.0f);  // 设置弹出窗口的大小
    
    CGRect rect = [self.tableView convertRect:_highilghtRowFrame toView:[UIWindow getCurrentWindow]];
    rect.origin.x += 5;
    rect.size.width -= 10;
    previewingContext.sourceRect = rect;
    return childVC;
}

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PeekAndPopTableViewCell *cell = [PeekAndPopTableViewCell createCellWithXibName:@"PeekAndPopTableViewCell" TableView:tableView Identifier:@"PeekAndPopTableViewCellIdentifier"];
    [cell cellAsLastTableCell];
    [cell cellAsArrowImgCell:NO];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"点击了删除" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    _highilghtRowFrame = cell.frame;
}


@end
