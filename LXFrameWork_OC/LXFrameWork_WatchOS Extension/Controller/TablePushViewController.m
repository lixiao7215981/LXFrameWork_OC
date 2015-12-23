//
//  TablePushViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/12/22.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import "TablePushViewController.h"
#import "HomeTableViewCell.h"
#import "pushModel.h"

@interface TablePushViewController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *pushTableView;

@end

@implementation TablePushViewController

- (void)awakeWithContext:(id)context
{
    [super awakeWithContext:context];
    NSArray *dataArray = context;
    /**
     *  给Cell 设置数据 rowType 应该为 tableViewCell 的 identifier
     */
    [self.pushTableView setNumberOfRows:dataArray.count withRowType:@"pushTableCell"];
    // 遍历数据 添加到Cell 上
    [dataArray enumerateObjectsUsingBlock:^(pushModel *data, NSUInteger idx, BOOL * _Nonnull stop) {
        HomeTableViewCell *cellModel = [self.pushTableView rowControllerAtIndex:idx];
        [cellModel.cellLabel setText:data.labelText];
        [cellModel.cellLabel setTextColor:[UIColor redColor]];
        [cellModel.cellImage setImageNamed:data.imageName];
    }];
}

@end
