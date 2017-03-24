//
//  SDImageHorizontalLayout.h
//  SDImagePicker
//
//  Created by shansander on 2017/3/22.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDImageHorizontalLayout;

@protocol HorizontalLayoutDelegate <NSObject>

- (CGFloat)HorizontalLayout:(SDImageHorizontalLayout *)layout heightatIndexPath:(NSIndexPath *)path;

@end

@interface SDImageHorizontalLayout : UICollectionViewLayout

/**
 列间距
 */
@property (nonatomic, assign) CGFloat columnMargin;

/**
 行间距
 */
@property (nonatomic, assign) CGFloat rowMargin;


@property (nonatomic, assign) CGFloat rowCount;

//@property (nonatomic, assign) UIEdgeInsets sectionInsets;

@end
