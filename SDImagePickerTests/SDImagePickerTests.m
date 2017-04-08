//
//  SDImagePickerTests.m
//  SDImagePickerTests
//
//  Created by shansander on 2017/3/28.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface SDImagePickerTests : XCTestCase

@end

@implementation SDImagePickerTests

- (void)setUp {
    [super setUp];
    // 初始化的代码，在测试方法之前调用
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    // 释放测试用例的资源代码，这个方法会没有测试执行后调用
    
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    //测试用例的例子，注意测试用例一定要test开头
    
    NSLog(@"开始爱上单元测试的第一个单元测试");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
