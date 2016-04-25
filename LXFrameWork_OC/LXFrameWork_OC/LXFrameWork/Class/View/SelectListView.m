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

#define kRGBColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
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
@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UIButton *cover;

@end

@implementation SelectListView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self) {
        self = [super initWithFrame:frame];
        [self addSubview:self.textField];
        [self addSubview:self.arrowImg];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self addSubview:self.textField];
    [self addSubview:self.arrowImg];
}

- (void)textFieldDropDown
{
    if (!self.dataList.count) return;
    if (_isShowSelectList) return;
    _isShowSelectList = YES;
    [self rotateArrowImg:YES];
    
    UIWindow *window = [UIWindow getCurrentWindow];
    CGRect rect = [self.textField convertRect:self.textField.bounds toView:window];
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
    self.textField.placeholder = placeholder;
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    self.textField.font = font;
}

- (void)setDataList:(NSArray *)dataList
{
    _dataList = dataList;
    [self.tableView reloadData];
}

#pragma mark - UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self textFieldDropDown];
    return NO;
}

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
    self.textField.text = title;
    
    if ([self.delegate respondsToSelector:@selector(selectListView:didSelectRowAtIndexPath:)]) {
        [self.delegate selectListView:self didSelectRowAtIndexPath:indexPath];
    }
    [self coverClick];
}

#pragma mark - 懒加载控件

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:self.bounds];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.font = [UIFont systemFontOfSize:textFont];
        _textField.delegate = self;
    }
    return _textField;
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
        _arrowImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.bounds) - 15, 13 * 0.5, 13, 13)];
        _arrowImg.image = image;
    }
    return _arrowImg;
}

@end
