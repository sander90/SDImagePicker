//
//  SDSelectedImageActionSheetView.m
//  SDImagePicker
//
//  Created by shansander on 2017/3/22.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDSelectedImageActionSheetView.h"
#import "UtilsMacro.h"
#import "SDImageHorizontalLayout.h"
#import "ImageCollectionViewCell.h"
#import "CameraCollectionViewCell.h"
#import "SDCollectionManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "SDPhotoManager.h"
#import "SelectedImageHeadCollectionReusableView.h"
#import "SelectedEntranceCollectionViewCell.h"

#define itemIdentifier @"imagecollectionCell"

@implementation SDSelectedImageActionSheetView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, HEIGHT * 2.f / 3.f, WIDTH, HEIGHT/3.0f);
        self.max_show_image_count = 21;
        [self configCollectionView];
        [self configImageData];
    }
    return self;
}

- (void)configCollectionView
{
    [self.rootCollectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:[ImageCollectionViewCell getReuseIdentifier]];
    [self.rootCollectionView registerClass:[CameraCollectionViewCell class] forCellWithReuseIdentifier:[CameraCollectionViewCell getReuseIdentifier]];
    [self.rootCollectionView registerClass:[SelectedEntranceCollectionViewCell class] forCellWithReuseIdentifier:[SelectedEntranceCollectionViewCell getReuseIdentifier]];
    
   // self.rootCollectionView.delegate = self;
    self.rootCollectionView.dataSource = self;
    
    self.rootCollectionView.showsHorizontalScrollIndicator = false;
    
    [RACObserve(self.rootCollectionView, contentOffset) subscribeNext:^(id x) {
        NSLog(@"KVO %@",x);
        CGPoint point = [x CGPointValue];
        if (point.x < contentOffsetXZero) {
            NSLog(@"这里要做一点操作");
        }
    }];
}
- (void)configImageData
{
    PHAssetCollection *cameraRoll = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil].lastObject;
    
    NSMutableArray * mutableList = [NSMutableArray arrayWithCapacity:0];
    [SDPhotoManager getTimeLineSectionModelsForIos8AboveWithGroup:cameraRoll MaxCount:self.max_show_image_count success:^(NSMutableArray *list) {
        NSLog(@"list = %ld",list.count);
        [mutableList addObjectsFromArray:list];
    } failure:^(NSError *error) {
        
    }];
    
    self.thePhotoList = [NSArray arrayWithArray:mutableList];
    
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    NSLog(@"%s",__func__);
    
    contentOffsetXZero =[self.imageHorizontalLayout Unititemsize] * 3.f / 2.f;

    [self.rootCollectionView setContentOffset:CGPointMake(contentOffsetXZero, 0)];
    
}

- (void)showAction
{
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, HEIGHT * 2.f / 3.0f, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        if (finished) {
        }
    }];
}

- (UICollectionView *)rootCollectionView
{
    if (!_rootCollectionView) {
        UICollectionView * theView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.imageHorizontalLayout];
        [self addSubview:theView];
        _rootCollectionView = theView;
    }
    return _rootCollectionView;
}

- (SDImageHorizontalLayout *)imageHorizontalLayout
{
    if (!_imageHorizontalLayout) {
        SDImageHorizontalLayout * layout = [[SDImageHorizontalLayout alloc] init];
        
        _imageHorizontalLayout = layout;
    }
    return _imageHorizontalLayout;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.thePhotoList.count + 2;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SDImageBaseCollectionViewCell * cell = [SDCollectionManager ItemForCollectionView:collectionView atIndexPath:indexPath];
    [cell setUpView];
    if ([cell isKindOfClass:[ImageCollectionViewCell class]]) {
        ImageCollectionViewCell * imageCell = (ImageCollectionViewCell *)cell;
        [imageCell loadPhoto:self.thePhotoList[indexPath.row - 2]];
    }
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
