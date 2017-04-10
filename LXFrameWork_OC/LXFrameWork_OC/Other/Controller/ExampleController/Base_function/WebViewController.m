//
//  WebViewController.m
//  LXFrameWork_OC
//
//  Created by Xiao.Li on 17/4/10.
//  Copyright © 2017年 LXFrameWork. All rights reserved.
//

#import "WebViewController.h"
#import "BaseLineTableViewCell.h"
#import "HttpLoadWebViewController.h"
#import "HtmlCallUpCamearViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"WebView加载"];
    self.tableView.separatorStyle = UITableViewScrollPositionNone;
    [self addDataSource];
}

- (void) addDataSource
{
    [self.dataList removeAllObjects];
    [self.dataList addObject:@"WebView加载百度"];
    [self.dataList addObject:@"Html5 调用相机／相册"];
}

#pragma mark - TableViewDelegate/DataSource

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.dataList.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"WebViewControllerCellID";
    BaseLineTableViewCell *cell = [BaseLineTableViewCell createCellWithXibName:nil TableView:tableView Identifier:cellID];
    cell.textLabel.text = [self.dataList objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:17];
    if (indexPath.row) {
        [cell cellAsLastTableCell];
    }else{
        [cell cellAsFirstTableCell];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        HttpLoadWebViewController *httpLoad = [[HttpLoadWebViewController alloc] init];
        [self.navigationController pushViewController:httpLoad animated:YES];
    }else if(indexPath.row == 1){
        HtmlCallUpCamearViewController *h5CallUpSystem = [[HtmlCallUpCamearViewController alloc] init];
        [self.navigationController pushViewController:h5CallUpSystem animated:YES];
    }
}

@end
