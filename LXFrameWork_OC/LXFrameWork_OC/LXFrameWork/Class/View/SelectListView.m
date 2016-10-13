//
//  SelectListView.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 16/3/21.
//  Copyright © 2016年 LXFrameWork. All rights reserved.
//

#import "SelectListView.h"
#import "UIWindow+Extension.h"
#import "UIView+Extension.h"
#import "BundleTool.h"
#import "LXFrameWorkDefine.h"

#define animateDuration 0.3
#define textFont 13
#define tableViewHeight 130

static NSString * const selectListViewCellID = @"SelectListViewCell";

@interface SelectListView()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    BOOL _isAnimate;
    BOOL _isShowSelectList;
}

@property (nonatomic,strong) UIImageView *arrowImg;
@property (nonatomic,strong) UITableView *tableView;
//@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UIButton *selectBtn;
@property (nonatomic,strong) UIButton *cover;

@end

@implementation SelectListView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self) {
        self = [super initWithFrame:frame];
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.selectBtn];
        [self addSubview:self.arrowImg];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self addSubview:self.selectBtn];
    [self addSubview:self.arrowImg];
}

- (void)DropDownList
{
    if (!self.dataList.count) return;
    if (_isShowSelectList) return;
    _isShowSelectList = YES;
    [self rotateArrowImg:YES];
    
    UIWindow *window = [UIWindow getCurrentWindow];
    CGRect rect = [self.selectBtn convertRect:self.selectBtn.bounds toView:window];
    self.tableView.frame = CGRectMake(rect.origin.x, CGRectGetMaxY(rect), rect.size.width, 0);
    [window addSubview:self.cover];
    [window addSubview:self.tableView];
    
    [UIView animateWithDuration:animateDuration animations:^{
        self.tableView.height = self.tableHeight ? self.tableHeight : tableViewHeight;
    }completion:^(BOOL finished) {
        _isShowSelectList = YES;
    }];
}

- (void)coverClick
{
    [self rotateArrowImg:NO];
    [self.cover removeFromSuperview];
    
    [UIView animateWithDuration:animateDuration animations:^{
        self.tableView.height = 0;
    } completion:^(BOOL finished) {
        self.arrowImg.transform = CGAffineTransformIdentity;
        [self.tableView removeFromSuperview];
        _isShowSelectList = NO;
    }];
}

- (void) rotateArrowImg:(BOOL) flg
{
    if (_isAnimate) return;
    _isAnimate = YES;
    CGFloat rotate = (flg)? -M_PI_2 : M_PI_2;
    [UIView animateWithDuration:animateDuration animations:^{
        self.arrowImg.transform = CGAffineTransformRotate(self.arrowImg.transform, rotate);
    } completion:^(BOOL finished) {
        _isAnimate = NO;
    }];
}

#pragma mark - Set 方法
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    [self.selectBtn setTitle:placeholder forState:UIControlStateNormal];
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    self.selectBtn.titleLabel.font = font;
}

- (void)setDataList:(NSArray *)dataList
{
    _dataList = dataList;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:selectListViewCellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:selectListViewCellID];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.font = self.font ? self.font :[UIFont systemFontOfSize:textFont];
    //    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    NSString *title = [self.dataList objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *title = [self.dataList objectAtIndex:indexPath.row];
    [self.selectBtn setTitle:title forState:UIControlStateNormal];
    
    if ([self.delegate respondsToSelector:@selector(selectListView:didSelectRowAtIndexPath:)]) {
        [self.delegate selectListView:self didSelectRowAtIndexPath:indexPath];
    }
    [self coverClick];
}

#pragma mark - 懒加载控件

- (UIButton *)selectBtn
{
    if (!_selectBtn) {
        _selectBtn.backgroundColor = [UIColor clearColor];
        _selectBtn = [[UIButton alloc] initWithFrame:self.bounds];
        _selectBtn.titleLabel.font = [UIFont systemFontOfSize:textFont];
        _selectBtn.adjustsImageWhenHighlighted = NO;
        _selectBtn.titleEdgeInsets = UIEdgeInsetsMake(0, - _selectBtn.width * 0.4 , 0, 0);
        [_selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_selectBtn setBackgroundImage:[[BundleTool getImage:@"selectListView_input_back" FromBundle:LXFrameWorkBundle]resizableImageWithCapInsets:UIEdgeInsetsMake(4, 4, 4, 4) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal];
        [_selectBtn addTarget:self action:@selector(DropDownList) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectBtn;
}

- (UIButton *)cover
{
    if (!_cover) {
        _cover = [[UIButton alloc] initWithFrame:[UIWindow getCurrentWindow].bounds];
        [_cover addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cover;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.layer.cornerRadius = 3;
        _tableView.separatorStyle = UITableViewScrollPositionNone;
        _tableView.backgroundColor = kRGBColor(243, 243, 243, 1);
        _tableView.bounces = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 27;
    }
    return _tableView;
}

- (UIImageView *)arrowImg
{
    if (!_arrowImg) {
        UIImage *image = [BundleTool getImage:@"messagescenter_arrow_up" FromBundle:LXFrameWorkBundle];
        _arrowImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.bounds) - 15, self.bounds.size.height * 0.5 -  13 * 0.5, 13, 13)];
        _arrowImg.image = image;
    }
    return _arrowImg;
}

@end
