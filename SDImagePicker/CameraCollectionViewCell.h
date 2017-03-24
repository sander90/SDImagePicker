//
//  CameraCollectionViewCell.h
//  SDImagePicker
//
//  Created by shansander on 2017/3/24.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDImageBaseCollectionViewCell.h"
@class SDCameraView;

@interface CameraCollectionViewCell : SDImageBaseCollectionViewCell

@property (nonatomic, weak) SDCameraView * cameraView;

@end
