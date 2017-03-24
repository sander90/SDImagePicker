//
//  SDImageBaseCollectionViewCell.m
//  SDImagePicker
//
//  Created by shansander on 2017/3/24.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDImageBaseCollectionViewCell.h"

@implementation SDImageBaseCollectionViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (NSString * )getReuseIdentifier
{
    // 给子类来做
    return NSStringFromClass([self class]);
}

- (void)setUpView
{
    
}


@end
