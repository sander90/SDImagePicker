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

#define itemIdentifier @"imagecollectionCell"

@implementation SDSelectedImageActionSheetView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, HEIGHT, WIDTH, HEIGHT/3.0f);
        [self configCollectionView];
        
    }
    return self;
}

- (void)configCollectionView
{
    [self.rootCollectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:[ImageCollectionViewCell getReuseIdentifier]];
    [self.rootCollectionView registerClass:[CameraCollectionViewCell class] forCellWithReuseIdentifier:[CameraCollectionViewCell getReuseIdentifier]];
    
    self.rootCollectionView.delegate = self;
    self.rootCollectionView.dataSource = self;
    
    self.rootCollectionView.showsHorizontalScrollIndicator = false;
    
    [RACObserve(self.rootCollectionView, contentOffset) subscribeNext:^(id x) {
        NSLog(@"KVO %@",x);
    }];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    NSLog(@"%s",__func__);
}

- (void)showAction
{
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, HEIGHT * 2.f / 3.0f, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        if (finished) {
            NSLog(@"animation finish");
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
    return 16;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SDImageBaseCollectionViewCell * cell = [SDCollectionManager ItemForCollectionView:collectionView atIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor redColor]];
    [cell setUpView];
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
