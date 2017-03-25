//
//  ImageCollectionViewCell.h
//  SDImagePicker
//
//  Created by shansander on 2017/3/23.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDImageBaseCollectionViewCell.h"
#import "SDPhotoManager.h"

@interface ImageCollectionViewCell:SDImageBaseCollectionViewCell

@property (nonatomic, weak) UIImageView * theImageView;

- (void)loadPhoto:(PHAssetCollection *)asset;
@end
