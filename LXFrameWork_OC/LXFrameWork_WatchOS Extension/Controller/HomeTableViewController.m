//
//  HomeTableViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/12/21.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import "HomeTableViewController.h"
#import "hometableViewCell.h"
#import "pushModel.h"

@interface HomeTableViewController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *tableView;

@end

@implementation HomeTableViewController

/**
 *  相当于 viewDidLoad
 *
 *  @param context 跳转控制器时，从其他控制器传入的数据
 */
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // 创建tableView 数据源
    NSArray *dataList = @[@"Push展示",@"Modal展示",@"ModalPage展示",@"Menu菜单展示",@"Alert展示",@"ActionSheet展示",@"语音/Emoji输入",@"iOS->WatchOS"];
    
    /**
     *  给Cell 设置数据 rowType 应该为 tableViewCell 的 identifier
     */
    [self.tableView setNumberOfRows:dataList.count withRowType:@"HomeCell"];
    // 遍历数据 添加到Cell 上
    [dataList enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL * _Nonnull stop) {
        HomeTableViewCell *cellModel = [self.tableView rowControllerAtIndex:idx];
        [cellModel.cellLabel setText:dataList[idx]];
        [cellModel.cellImage setImageNamed:dataList[idx]];
    }];
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    if (rowIndex == 0) {
        // 创建 CellData
        pushModel *row1 = [pushModel createPushModelWithimage :@"image1" Andtext:@"cell_1"];
        pushModel *row2 = [pushModel createPushModelWithimage:@"image2" Andtext:@"cell_2"];
        pushModel *row3 = [pushModel createPushModelWithimage:@"image1" Andtext:@"cell_3"];
        pushModel *row4 = [pushModel createPushModelWithimage:@"image2" Andtext:@"cell_4"];
        pushModel *row5 = [pushModel createPushModelWithimage:@"image1" Andtext:@"cell_5"];
        NSArray *dataArray = @[row1,row2,row3,row4,row5];
        /**
         *  已 push 的方式打开另一个控制器，
         *  WithName   需要跳转控制器的 identifier
         *  context    传入跳转控制器的 数据
         */
        [self pushControllerWithName:@"tablePush" context:dataArray];
    }else if (rowIndex == 1){
        // 创建 Data
        pushModel *data = [pushModel createPushModelWithimage :@"image1" Andtext:@"Modal形式展示"];
        [self presentControllerWithName:@"modalController" context:data];
    }else if (rowIndex == 2){
        // 创建 Data
        pushModel *data1 = [pushModel createPushModelWithimage :@"image1" Andtext:@"ModalPage形式展示"];
        pushModel *data2 = [pushModel createPushModelWithimage :@"image2" Andtext:@"ModalPage形式展示"];
        // 创建 CellData
        pushModel *row1 = [pushModel createPushModelWithimage :@"image1" Andtext:@"ModalPage"];
        pushModel *row2 = [pushModel createPushModelWithimage:@"image2" Andtext:@"ModalPage"];
        pushModel *row3 = [pushModel createPushModelWithimage:@"image1" Andtext:@"ModalPage"];
        pushModel *row4 = [pushModel createPushModelWithimage:@"image2" Andtext:@"ModalPage"];
        NSArray *dataArray = @[row1,row2,row3,row4];
        /**
         *  present
         */
        [self presentControllerWithNames:@[@"modalController",@"modalController",@"tablePush"] contexts:@[data1,data2,dataArray]];
        
    }else if (rowIndex == 3){
        // 跳转到 Menu 菜单
        [self pushControllerWithName:@"menuController" context:nil];
    }else if (rowIndex == 4){
        WKAlertAction *action1 = [WKAlertAction actionWithTitle:@"确定" style:WKAlertActionStyleDefault handler:^{
            NSLog(@"确定");
        }];
        WKAlertAction *action2 = [WKAlertAction actionWithTitle:@"取消" style:WKAlertActionStyleCancel handler:^{
            NSLog(@"取消");
        }];
        WKAlertAction *action3 = [WKAlertAction actionWithTitle:@"删除" style:WKAlertActionStyleDestructive handler:^{
            NSLog(@"删除");
        }];
        [self presentAlertControllerWithTitle:@"提示" message:@"您确定要xxoo吗？" preferredStyle:WKAlertControllerStyleAlert actions:@[action1,action2,action3]];
        
    }else if (rowIndex == 5){
        WKAlertAction *action1 = [WKAlertAction actionWithTitle:@"确定" style:WKAlertActionStyleDefault handler:^{
            NSLog(@"确定");
        }];
        WKAlertAction *action2 = [WKAlertAction actionWithTitle:@"取消" style:WKAlertActionStyleCancel handler:^{
            NSLog(@"取消");
        }];
        WKAlertAction *action3 = [WKAlertAction actionWithTitle:@"删除" style:WKAlertActionStyleDestructive handler:^{
            NSLog(@"删除");
        }];
        /**
         *  WKAlertControllerStyleAlert         类型 正常alert 显示
         *  WKAlertControllerStyleActionSheet   类型 WKAlertAction 是 WKAlertActionStyleCancel类型时，会在左上角充当返回
         */
        [self presentAlertControllerWithTitle:@"提示" message:@"您确定要xxoo吗？" preferredStyle:WKAlertControllerStyleActionSheet actions:@[action1,action2,action3]];
    }else if(rowIndex == 6){
        [self presentTextInputControllerWithSuggestions:@[@"建议一",@"建议二",@"建议三"] allowedInputMode:WKTextInputModeAllowAnimatedEmoji completion:^(NSArray * _Nullable results) {
            NSLog(@"%@",results);
            
        }];
    }else if (rowIndex == 7){
        // iOS -> WatchOS
        [self pushControllerWithName:@"iOSToWatchOS" context:nil];
    }else if (rowIndex == 8){
       // WatchOS -> iOS
    }
}

/**
 *  点击了 Glance 默认会打开主程序首页，如果你想显示一个不同的界面控制器
 *  需要在 awakeWithContext 或者 willActivate 里 调用updateUserActivity 方法,传递一个Dictionary
 *  在主程序中首页控制器实现 - (void)handleUserActivity:(NSDictionary *)userInfo
 */
- (void)handleUserActivity:(NSDictionary *)userInfo
{
    NSLog(@"%@",userInfo);
    pushModel *data = [pushModel createPushModelWithimage :@"image1" Andtext:@"Modal形式展示"];
    [self pushControllerWithName:[userInfo objectForKey:@"GoToViewController"] context:data];
}


/**
 *  相当于 viewWillAppear
 */
- (void)willActivate {
    [super willActivate];
}

/**
 *  相当于 viewDidAppear
 */
- (void)didDeactivate {
    [super didDeactivate];
}

@end



