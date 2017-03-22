//
//  ViewController.m
//  SDImagePicker
//
//  Created by shansander on 2017/3/22.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "ViewController.h"
#import "SDCameraView.h"

@interface ViewController ()

@property (nonatomic, weak) SDCameraView * cameraView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSelectedImage:(id)sender
{
    NSLog(@"selected image");
    
    self.cameraView.center = self.view.center;
}

- (SDCameraView *)cameraView
{
    if (!_cameraView) {
        SDCameraView * theView = [[SDCameraView alloc] init];
        [self.view addSubview:theView];
        _cameraView = theView;
    }
    return _cameraView;
}

@end
