//
//  SDCameraView.m
//  SDImagePicker
//
//  Created by shansander on 2017/3/22.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDCameraView.h"
#import <AVFoundation/AVFoundation.h>
@interface SDCameraView ()
//捕获设备，通常是前置摄像头，后置摄像头，麦克风（音频输入）
@property (nonatomic)AVCaptureDevice * device;

//AVCaptureDeviceInput 代表输入设备，他使用AVCaptureDevice 来初始化
@property(nonatomic)AVCaptureDeviceInput *input;

//当启动摄像头开始捕获输入
@property(nonatomic)AVCaptureMetadataOutput *output;

@property (nonatomic)AVCaptureStillImageOutput *ImageOutPut;

//session：由他把输入输出结合在一起，并开始启动捕获设备（摄像头）
@property(nonatomic)AVCaptureSession *session;

//图像预览层，实时显示捕获的图像
@property(nonatomic)AVCaptureVideoPreviewLayer *previewLayer;

@property (nonatomic) BOOL canCamera;
@end

@implementation SDCameraView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 200, 250);
        _canCamera = [self canUseCamera];
        if (_canCamera) {
            [self customCamera];
            [self customUI];
        }else{
            NSLog(@"启动Camera失败!!!");
        }
    }
    return self;
}

- (BOOL)canUseCamera{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusDenied) {
        NSLog(@"denied");
        return NO;
    }
    return YES;
}

- (void)customUI
{
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shutterCamera:)];
    [self addGestureRecognizer:tapGesture];
    
}

-(void)customCamera
{
    self.backgroundColor = [UIColor whiteColor];
    
    //使用AVMediaTypeVideo 指明self.device代表视频，默认使用后置摄像头进行初始化
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    //使用设备初始化输入
    self.input = [[AVCaptureDeviceInput alloc] initWithDevice:self.device error:nil];
    //生成输出对象
    self.output = [[AVCaptureMetadataOutput alloc] init];
    self.ImageOutPut = [[AVCaptureStillImageOutput alloc] init];
    
    //生成会话，用来结合输入输出
    self.session = [[AVCaptureSession alloc] init];
    self.session = [[AVCaptureSession alloc]init];
    if ([self.session canSetSessionPreset:AVCaptureSessionPreset1280x720]) {
        
        self.session.sessionPreset = AVCaptureSessionPreset1280x720;
        
    }
    if ([self.session canAddInput:self.input]) {
        [self.session addInput:self.input];
    }
    
    if ([self.session canAddOutput:self.ImageOutPut]) {
        [self.session addOutput:self.ImageOutPut];
    }
    //使用self.session，初始化预览层，self.session负责驱动input进行信息的采集，layer负责把图像渲染显示
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:self.session];
    self.previewLayer.frame = self.bounds;
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.layer addSublayer:self.previewLayer];
    
    //开始启动
    [self.session startRunning];
    if ([_device lockForConfiguration:nil]) {
        if ([_device isFlashModeSupported:AVCaptureFlashModeAuto]) {
            [_device setFlashMode:AVCaptureFlashModeAuto];
        }
        //自动白平衡
        if ([_device isWhiteBalanceModeSupported:AVCaptureWhiteBalanceModeAutoWhiteBalance]) {
            [_device setWhiteBalanceMode:AVCaptureWhiteBalanceModeAutoWhiteBalance];
        }
        [_device unlockForConfiguration];
    }

    
}
#pragma mark - 截取照片
- (void)shutterCamera:(UIGestureRecognizer *)gesure
{
    AVCaptureConnection * videoConnection = [self.ImageOutPut connectionWithMediaType:AVMediaTypeVideo];
    if (!videoConnection) {
        NSLog(@"take phone failed!");
        return;
    }
    [self.ImageOutPut captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if (imageDataSampleBuffer == NULL) {
            return ;
        }
        NSData * imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
        UIImage * image = [UIImage imageWithData:imageData];
        [self.session stopRunning];
        [self saveImageToPhotoAlbum:image];
        NSLog(@"image size = %@",NSStringFromCGSize(image.size));
    }];
    
}

#pragma - 保存至相册
- (void)saveImageToPhotoAlbum:(UIImage*)savedImage
{
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

// 指定回调方法

- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo

{
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"保存图片结果提示"
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
