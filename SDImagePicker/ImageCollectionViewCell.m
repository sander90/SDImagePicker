//
//  ImageCollectionViewCell.m
//  SDImagePicker
//
//  Created by shansander on 2017/3/23.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "ImageCollectionViewCell.h"

#import <Masonry.h>


@implementation ImageCollectionViewCell

- (void)setUpView
{
  
}
- (void)loadPhoto:(PHAsset *)asset
{
    NSLog(@"load photo");
    PHImageRequestOptions * options = [[PHImageRequestOptions alloc] init];
    [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:self.bounds.size contentMode:PHImageContentModeAspectFill options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.theImageView.image = result;
        });
    }];
}

- (UIImageView *)theImageView
{
    if (!_theImageView) {
        UIImageView * theView = [[UIImageView alloc] init];
        [self addSubview:theView];
        [theView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(0);
            make.right.equalTo(self).offset(0);
            make.left.equalTo(self).offset(0);
            make.bottom.equalTo(self).offset(0);
        }];
        theView.contentMode = UIViewContentModeScaleAspectFill;
        _theImageView = theView;
    }
    return _theImageView;
}
@end
