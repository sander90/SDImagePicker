//
//  SelectedEntranceCollectionViewCell.m
//  SDImagePicker
//
//  Created by shansander on 2017/3/25.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SelectedEntranceCollectionViewCell.h"
#import <Masonry.h>

@implementation SelectedEntranceCollectionViewCell

- (void)setUpView{
    //初始化
    self.layer.masksToBounds = true;
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = 1.0f;
    NSLog(@"set up view !!!");
    self.theCameraInputButton.backgroundColor = [UIColor redColor];
    self.thePhotoInputButton.backgroundColor = [UIColor redColor];
    [self.theCameraInputButton addTarget:self action:@selector(onCameraAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.thePhotoInputButton addTarget:self action:@selector(onSelectedPhotoAction:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (UIView *)theCameraInputButton
{
    if (!_theCameraInputButton) {
        UIButton * theView = [[UIButton alloc] init];
        [self addSubview:theView];
        [theView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_equalTo(self.frame.size.width / 2.0f);
            make.centerX.equalTo(self).offset(0);
            make.centerY.equalTo(self).offset(self.frame.size.width / 4.0f + 5.0f);
        }];
        _theCameraInputButton = theView;
    }
    return _theCameraInputButton;
}
- (UIView * )thePhotoInputButton
{
    if (!_thePhotoInputButton) {
        UIButton * theView = [[UIButton alloc] init];
        [self addSubview:theView];
        [theView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_equalTo(self.frame.size.width / 2.0f);
            make.centerX.equalTo(self).offset(0);
            make.centerY.equalTo(self).offset(- self.frame.size.width / 4.0f - 5.0f);
        }];
        _thePhotoInputButton = theView;
    }
    return _thePhotoInputButton;
}
- (void)onSelectedPhotoAction:(id)sender
{
    
}
- (void)onCameraAction:(id)sender
{
    
}
@end
