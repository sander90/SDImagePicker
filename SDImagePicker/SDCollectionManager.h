//
//  SDCollectionManager.h
//  SDImagePicker
//
//  Created by shansander on 2017/3/24.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class SDImageBaseCollectionViewCell;

@interface SDCollectionManager : NSObject

+ (SDImageBaseCollectionViewCell *)ItemForCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexpath;

@end
