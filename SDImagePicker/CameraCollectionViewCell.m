//
//  CameraCollectionViewCell.m
//  SDImagePicker
//
//  Created by shansander on 2017/3/24.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "CameraCollectionViewCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation CameraCollectionViewCell

- (void)setUpView
{
    NSLog(@"%s",__func__);
    [RACObserve(self, center) subscribeNext:^(id x) {
        NSLog(@"what %@",x);
    }];
}

@end
