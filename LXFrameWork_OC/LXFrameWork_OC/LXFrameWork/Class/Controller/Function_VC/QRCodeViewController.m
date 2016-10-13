//
//  QRCodeViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/8/6.
//  Copyright (c) 2015年 LXFrameWork. All rights reserved.
//

#import "QRCodeViewController.h"
#import "BundleTool.h"

@interface QRCodeViewController() <AVCaptureMetadataOutputObjectsDelegate>
{
    NSLayoutConstraint *_topCos;
    NSTimer *_timer;
}
/**
 *  输入输出中间那座大大的桥
 */
@property (nonatomic,strong) AVCaptureSession * capSession;

@end

@implementation QRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"二维码/条形码"];
    
    // 添加扫描框和关闭按钮
    [self addQRCodeImgCase];
    // 添加开关闪光灯按钮
    [self addFlashLightBcakBtn];
    
    //获取摄像设备
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建输入流
    NSError *error = nil;
    AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (error) {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"未获得使用相机的权限,请到设置中更改权限" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
        return;
    }
    //创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
    //设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    // 设置反应区域
    output.rectOfInterest=CGRectMake(0.2,0,0.5, 1);
    //初始化链接对象
    _capSession = [[AVCaptureSession alloc]init];
    //高质量采集率
    [_capSession setSessionPreset:AVCaptureSessionPresetHigh];
    [_capSession addInput:input];
    [_capSession addOutput:output];
    //设置扫码支持的编码格式(条形码和二维码兼容)
    output.metadataObjectTypes=@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    // 显示摄像头取到的图像
    AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:_capSession];
    layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    CGRect frame = self.view.layer.bounds;
    if (frame.size.width > frame.size.height) {
        layer.frame = CGRectMake(0, 0, frame.size.height, frame.size.width);
    }else{
        layer.frame = self.view.layer.bounds;
    }
    [self.view.layer insertSublayer:layer atIndex:0];
    //走起！！
    [_capSession startRunning];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (!_timer.isValid) {
        [self updateTimer];
        _timer = [NSTimer timerWithTimeInterval:3.0f target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)startCaptureSession
{
    [_capSession startRunning];
}

- (void) updateTimer
{
    _topCos.constant = _scanBgImg.frame.size.height - 20;
    [UIView animateWithDuration:1.5f animations:^{
        [self.view layoutIfNeeded];
    }completion:^(BOOL finished) {
        _topCos.constant = 20;
        [UIView animateWithDuration:1.5f animations:^{
            [self.view layoutIfNeeded];
        }];
    }];
}

- (void) addQRCodeImgCase
{
    UIImageView *scanBgImg = [UIImageView newAutoLayoutView];
    _scanBgImg = scanBgImg;
    [self.view addSubview:scanBgImg];
    [scanBgImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.view withOffset:-20];
    [scanBgImg autoAlignAxisToSuperviewAxis:ALAxisVertical];
    scanBgImg.image = [BundleTool getImage:@"QRcode" FromBundle:LXFrameWorkBundle];
    
    UIImageView *scanLineImg = [UIImageView newAutoLayoutView];
    scanLineImg.image = [BundleTool getImage:@"QRCode_scanLine" FromBundle:LXFrameWorkBundle];
    [self.view addSubview:scanLineImg];
    [scanLineImg autoAlignAxis:ALAxisVertical toSameAxisOfView:scanBgImg];
    _topCos = [scanLineImg autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:scanBgImg withOffset:20];
}

- (void) addFlashLightBcakBtn
{
    UIButton *backButton = [UIButton newAutoLayoutView];
    [self.view addSubview:backButton];
    [backButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_scanBgImg];
    [backButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:30];
    [backButton addTarget:self action:@selector(cleanBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage:[BundleTool getImage:@"QRCodeBackBtn" FromBundle:LXFrameWorkBundle]forState:UIControlStateNormal];
    
    UIButton *lightButton = [UIButton newAutoLayoutView];
    [self.view addSubview:lightButton];
    [lightButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_scanBgImg];
    [lightButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:30];
    [lightButton setImage:[BundleTool getImage:@"QRCodeFlashlight" FromBundle:LXFrameWorkBundle] forState:UIControlStateNormal];
    [lightButton setImage:[BundleTool getImage:@"QRCodeFlashlight_open" FromBundle:LXFrameWorkBundle] forState:UIControlStateSelected];
    [lightButton addTarget:self action:@selector(lightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        for(AVMetadataObject *current in metadataObjects) {
            // 可以根据 current.type 判断扫描类型
            if ([current isKindOfClass:[AVMetadataMachineReadableCodeObject class]]){
                NSString *scannedResult = [(AVMetadataMachineReadableCodeObject *) current stringValue];
                if (_delegate && [_delegate respondsToSelector:@selector(ReaderCode:didScanResult:)]) {
                    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
                    [_capSession stopRunning];
                    [_timer invalidate];
                    [_delegate ReaderCode:self didScanResult:scannedResult];
                }
                break;
            }
        }
    }
}

- (void) lightButtonClick:(UIButton *) button
{
    button.selected = !button.selected;
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (![device hasTorch]) return;
    if (button.selected) {
        [device lockForConfiguration:nil];
        [device setTorchMode: AVCaptureTorchModeOn];
        [device unlockForConfiguration];
    }else{
        [device lockForConfiguration:nil];
        [device setTorchMode: AVCaptureTorchModeOff];
        [device unlockForConfiguration];
    }
}

- (void) cleanBtnClick
{
    if (_delegate && [_delegate respondsToSelector:@selector(ReaderCoderDidCancel:)]) {
        [_capSession stopRunning];
        [_delegate ReaderCoderDidCancel:self];
    }
}

- (void) setScanCaseImg:(UIImage *)scanCaseImg
{
    _scanCaseImg = scanCaseImg;
    _scanBgImg.image = scanCaseImg;
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self cleanBtnClick];
    }
}

#pragma mark - 禁止该页面的屏幕旋转

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(BOOL)shouldAutorotate
{
    return NO;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
