//
//  SDPhotoManager.h
//  SDImagePicker
//
//  Created by shansander on 2017/3/22.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

@interface SDPhotoManager : NSObject
+ (NSMutableArray *)getCollecionsWithSmartAlbumSubtype:(PHAssetCollectionSubtype)subtype;

+ (void)getTimeLineSectionModelsForIos8AboveWithGroup:(PHAssetCollection *)collection MaxCount:(NSInteger)maxCount success:(void (^)(NSMutableArray *))success failure:(void (^)(NSError *))failure;

@end
