//
//  ImageCollectionViewCell.m
//  SDImagePicker
//
//  Created by shansander on 2017/3/23.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "ImageCollectionViewCell.h"

@implementation ImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        NSLog(@"item");
    }
    return self;
}

@end
