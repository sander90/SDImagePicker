//
//  SDImageHorizontalLayout.m
//  SDImagePicker
//
//  Created by shansander on 2017/3/22.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDImageHorizontalLayout.h"

@interface SDImageHorizontalLayout ()
{
}
@property (nonatomic, assign) CGFloat max_X;

/**
 存放所有的布局属性
 */
@property (nonatomic, strong) NSMutableArray * attrsArray;

@property (nonatomic, strong) NSMutableDictionary * maxXDic;


@end

@implementation SDImageHorizontalLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.sectionInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        self.rowCount = 2;
        self.columnMargin = 5;
        self.rowMargin = 5;
        self.attrsArray = [[NSMutableArray alloc] init];
        self.maxXDic = [[NSMutableDictionary alloc] init];
        
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
    
    // 计算所有cell的属性添加到数组中
    [self.attrsArray removeAllObjects];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0 ; i < count; i ++) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        
        UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        [self.attrsArray addObject:attrs];
        if (i == count - 1) {
            if (count % 2 == 0) {
                self.max_X = CGRectGetMaxX(attrs.frame);
            }
        }
    }
    
    
    
}

- (CGFloat)Unititemsize
{
    CGFloat height_item = (self.collectionView.frame.size.height - self.rowMargin) / 2.0f;
    return height_item;
}
//计算出布局的地方
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger row = indexPath.row;
        
    CGFloat height_item = [self Unititemsize];
    CGFloat width_item = height_item ;

    CGFloat x_item = 0.0f;
    CGFloat y_item = 0.0f;
    
    
    if (row < 2) {
        if (row == 1) {
            x_item = self.max_X;
        }
        // 第一个和第二个都是特殊的Item
        width_item = width_item * 3.f / 2.f;
        height_item = self.collectionView.frame.size.height;
        self.max_X = x_item + width_item;

    }else{
        NSInteger section_item = (row + 1) % 2;
        
        x_item = self.max_X + self.columnMargin;
        
        y_item = section_item * (height_item + self.rowMargin);
        
        if (section_item == 1) {
            self.max_X = x_item + width_item;
        }
        
    }
    
    UICollectionViewLayoutAttributes * attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.frame = CGRectMake(x_item, y_item, width_item, height_item);
    return attrs;
}
// 这个方法需要返回所有的attrs，但是每次重新布局时，prepareLayout就已经计算好了，就需要再重新计算了
- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

- (CGSize)collectionViewContentSize
{
    
    return CGSizeMake(self.max_X, self.collectionView.frame.size.height);
}




@end
