//
//  SDSelectedImageActionSheetView.h
//  SDImagePicker
//
//  Created by shansander on 2017/3/22.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SDImageHorizontalLayout;
@interface SDSelectedImageActionSheetView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) UICollectionView * rootCollectionView;

@property (nonatomic, strong) SDImageHorizontalLayout * imageHorizontalLayout;

@property (nonatomic, strong) NSArray * thePhotoList;

@property (nonatomic, assign) NSInteger max_show_image_count;

- (void)showAction;

@end
