//
//  SDSelectedImageActionSheetView.h
//  SDImagePicker
//
//  Created by shansander on 2017/3/22.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDSelectedImageActionSheetView : UIView

@property (nonatomic, weak) UICollectionView * rootCollectionView;

- (void)showAction;

@end
