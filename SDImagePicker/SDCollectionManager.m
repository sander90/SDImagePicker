//
//  SDCollectionManager.m
//  SDImagePicker
//
//  Created by shansander on 2017/3/24.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDCollectionManager.h"

#import "ImageCollectionViewCell.h"
#import "CameraCollectionViewCell.h"

@implementation SDCollectionManager

+ (SDImageBaseCollectionViewCell *)ItemForCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexpath
{
    SDImageBaseCollectionViewCell * cell;
    if (indexpath.row == 0) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:[CameraCollectionViewCell getReuseIdentifier] forIndexPath:indexpath];
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ImageCollectionViewCell getReuseIdentifier] forIndexPath:indexpath];
    }
    return cell;
}

@end
