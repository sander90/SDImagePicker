//
//  CameraCollectionViewCell.m
//  SDImagePicker
//
//  Created by shansander on 2017/3/24.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "CameraCollectionViewCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "SDCameraView.h"

@implementation CameraCollectionViewCell

- (void)setUpView
{
    NSLog(@"%s",__func__);
    
    SDCameraView * camera = self.cameraView;
    
}

- (SDCameraView *)cameraView
{
    if (!_cameraView) {
        SDCameraView * camera = [[SDCameraView alloc] initWithFrame:self.bounds];
        [self addSubview:camera];
        _cameraView = camera;
    }
    return _cameraView;
}


@end
