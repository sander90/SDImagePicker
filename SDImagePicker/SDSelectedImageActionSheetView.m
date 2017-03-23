//
//  SDSelectedImageActionSheetView.m
//  SDImagePicker
//
//  Created by shansander on 2017/3/22.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDSelectedImageActionSheetView.h"
#import "UtilsMacro.h"

@implementation SDSelectedImageActionSheetView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, HEIGHT, WIDTH, HEIGHT/3.0f);
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    NSLog(@"%s",__func__);
}

- (void)showAction
{
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, HEIGHT * 2.f / 3.0f, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        if (finished) {
            NSLog(@"animation finish");
        }
    }];
}

- (UICollectionView *)rootCollectionView
{
    if (!_rootCollectionView) {
        //UICollectionView * theView = [[UICollectionView alloc] initWithFrame:<#(CGRect)#> collectionViewLayout:(nonnull UICollectionViewLayout *)]
    }
    return _rootCollectionView;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
