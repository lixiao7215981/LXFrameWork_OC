//
//  TestTableViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/7/8.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "TestTableViewController.h"

@interface TestTableViewController ()

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BaseCellItem *item = [BaseCellItem createBaseCellItemWithIcon:nil AndTitle:@"1111" SubTitle:nil ClickOption:nil];
    
    BaseCellItemGroup *group = [BaseCellItemGroup createGroupWithItem:@[item]];
    [self.dataList addObject:group];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld条测试数据",indexPath.row];
    return cell;
}



@end
