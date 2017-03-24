//
//  SDImageBaseCollectionViewCell.h
//  SDImagePicker
//
//  Created by shansander on 2017/3/24.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDImageBaseCollectionViewCell : UICollectionViewCell
+ (NSString * )getReuseIdentifier;

- (void)setUpView;
@end
