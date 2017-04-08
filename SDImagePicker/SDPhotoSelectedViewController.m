//
//  SDPhotoSelectedViewController.m
//  SDImagePicker
//
//  Created by shansander on 2017/3/28.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDPhotoSelectedViewController.h"
#import "SDSelectedImageActionSheetView.h"

@interface SDPhotoSelectedViewController ()

@property (nonatomic, weak) SDSelectedImageActionSheetView * theSelectedImageActionView;

@end

@implementation SDPhotoSelectedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.theSelectedImageActionView;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (SDSelectedImageActionSheetView * )theSelectedImageActionView
{
    if (!_theSelectedImageActionView) {
        SDSelectedImageActionSheetView * theView = [[SDSelectedImageActionSheetView alloc] init];
        [self.view addSubview:theView];
        _theSelectedImageActionView = theView;
    }
    return _theSelectedImageActionView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
