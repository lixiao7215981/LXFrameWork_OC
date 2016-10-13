//
//  SystemHttpDetailCell.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 16/2/18.
//  Copyright © 2016年 LXFrameWork. All rights reserved.
//

#import "SystemHttpDetailCell.h"
#import "BundleTool.h"

@interface SystemHttpDetailCell()
@property (weak, nonatomic) IBOutlet UILabel *httpUrl;
@property (weak, nonatomic) IBOutlet UILabel *requestTime;
@property (weak, nonatomic) IBOutlet UIImageView *stateImage;

@end

@implementation SystemHttpDetailCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"SysetmHttpDebugControllerCellID";
    SystemHttpDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MYBUNDLE loadNibNamed:@"SystemHttpDetailCell" owner:nil options:nil]lastObject];
        //        cell = [[[NSBundle mainBundle] loadNibNamed:@"SystemHttpDetailCell" owner:nil options:nil]lastObject];
    }
    return cell;
}

- (void)setModel:(HttpToolLogModel *)model
{
    _model = model;
    self.httpUrl.text = model.request_URL;
    self.requestTime.text = model.request_time;
    if (model.isSuccess) {
        self.stateImage.image = [BundleTool getImage:@"http_success" FromBundle:LXFrameWorkBundle];
    }else{
        self.stateImage.image = [BundleTool getImage:@"http_error" FromBundle:LXFrameWorkBundle];
    }
}

@end
