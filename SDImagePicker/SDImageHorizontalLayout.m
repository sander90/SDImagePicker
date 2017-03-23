//
//  SDImageHorizontalLayout.m
//  SDImagePicker
//
//  Created by shansander on 2017/3/22.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDImageHorizontalLayout.h"

@interface SDImageHorizontalLayout ()
@property (nonatomic, strong) NSMutableDictionary * maxYDict;

/**
 存放所有的布局属性
 */
@property (nonatomic, strong) NSMutableArray * attrsArray;


@end

@implementation SDImageHorizontalLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sectionInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        self.rowCount = 2;
        self.columnMargin = 10;
        self.rowMargin = 10;
        
    }
    return self;
}
//这个方法的设定是为了保证只要布局重新计算,我们就刷新layout里面的attributes
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
//貌似还有可以改善的地方,就是此时只去遍历屏幕中能看见的cell,而不是去遍历整个collectionview中所有cell
// 每次重新布局都需要调用这个方法，所以要将之前存储的item的属性和maxY都要清空，重新计算
- (void)prepareLayout
{
    [super prepareLayout];
    
    for (int i = 0; i < self.rowCount; i ++) {
        
    }
    
    // 计算所有的属性
    
}

@end
