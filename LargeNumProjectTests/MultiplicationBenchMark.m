//
//  MultiplicationBenchMark.m
//  LargeNumProject
//
//  Created by Xander on 3/2/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LargeIntCalculator.h"
#import "LargeNumGenerator.h"
@interface MultiplicationBenchMark : XCTestCase

@end

@implementation MultiplicationBenchMark{
    LargeIntCalculator *calc;
    LargeInt *test1;
    LargeInt *test2;
    LargeInt *result;
    LargeNumGenerator *gen;
}

- (void)setUp {
    [super setUp];
    
    calc = [[LargeIntCalculator alloc] init];
    test1 = [[LargeInt alloc] init];
    test2 = [[LargeInt alloc] init];
    result = [[LargeInt alloc] init];
    gen = [[LargeNumGenerator alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    calc = nil;
    test1 = nil;
    test2 = nil;
    result = nil;
    gen = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
}
//- (void)test10Dig {
//    test1 = [gen generateLargeIntWithLength:10];
//    test2 = [gen generateLargeIntWithLength:10];
//    [self measureBlock:^{
//        result = [calc multiply:test1 by:test2];
//    }];
//}
//
//- (void)test100Dig {
//    test1 = [gen generateLargeIntWithLength:100];
//    test2 = [gen generateLargeIntWithLength:100];
//    [self measureBlock:^{
//        result = [calc multiply:test1 by:test2];
//    }];
//}
//- (void)test1000Dig {
//    test1 = [gen generateLargeIntWithLength:1000];
//    test2 = [gen generateLargeIntWithLength:1000];
//    [self measureBlock:^{
//        result = [calc multiply:test1 by:test2];
//    }];
//}
//- (void)test10000Dig {
//    test1 = [gen generateLargeIntWithLength:10000];
//    test2 = [gen generateLargeIntWithLength:10000];
//    [self measureBlock:^{
//        result = [calc multiply:test1 by:test2];
//    }];
//}


@end
