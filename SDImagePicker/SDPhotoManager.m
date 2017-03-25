//
//  SDPhotoManager.m
//  SDImagePicker
//
//  Created by shansander on 2017/3/22.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDPhotoManager.h"

@implementation SDPhotoManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (NSArray *)getOriginalImages
{
//    PHFetchResult * 
    return @[];
}

+ (NSMutableArray *)getCollecionsWithSmartAlbumSubtype:(PHAssetCollectionSubtype)subtype {
    PHFetchOptions *userAlbumsOptions = [PHFetchOptions new];
    PHFetchResult *userAlbumsResult = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum
                                                                               subtype:PHAssetCollectionSubtypeAny
                                                                               options:userAlbumsOptions];
    PHFetchResult *userSmartAlbumsResult = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum
                                                                                    subtype:subtype
                                                                                    options:userAlbumsOptions];
    NSMutableArray *collections = [NSMutableArray array];
    void (^AlbumEnumerateObjectsUsingBlock)(PHAssetCollection *, NSUInteger idx, BOOL *) = ^(PHAssetCollection * _Nonnull collection, NSUInteger idx, BOOL * _Nonnull stop) {
        if (collection.estimatedAssetCount == 0) {
            return ;
        }
        NSUInteger numberOfAssets = 0;
        PHFetchResult *assetsResult = [PHAsset fetchAssetsInAssetCollection:collection options:nil];
        numberOfAssets = [assetsResult countOfAssetsWithMediaType:PHAssetMediaTypeImage];
        if (numberOfAssets == 0) {
            return;
        }
        [collections addObject:collection];
    };
    [userSmartAlbumsResult enumerateObjectsUsingBlock:AlbumEnumerateObjectsUsingBlock];
    [userAlbumsResult enumerateObjectsUsingBlock:AlbumEnumerateObjectsUsingBlock];
    return collections;
}

+ (void)getTimeLineSectionModelsForIos8AboveWithGroup:(PHAssetCollection *)collection MaxCount:(NSInteger)maxCount success:(void (^)(NSMutableArray *))success failure:(void (^)(NSError *))failure {
    PHFetchResult *assetsResult = [PHAsset fetchAssetsInAssetCollection:collection options:[self fetchOptions]];
    NSMutableArray *sectionModels = [NSMutableArray array];
    [assetsResult enumerateObjectsUsingBlock:^(PHAsset * _Nonnull asset, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < maxCount) {
            [sectionModels addObject:asset];
        }
    }];
    if (success != nil && sectionModels.count > 0) {
        success(sectionModels);
    }
    if (failure != nil && sectionModels.count == 0) {
        failure(nil);
    }
}
+ (PHFetchOptions *)fetchOptions {
    PHFetchOptions *fetchOptions = [PHFetchOptions new];
    fetchOptions.predicate = [NSPredicate predicateWithFormat:@"mediaType = %@", @(PHAssetMediaTypeImage)];
    fetchOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    return fetchOptions;
}
@end
