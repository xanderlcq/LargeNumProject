//
//  AdditionBenchMark.m
//  LargeNumProject
//
//  Created by Xander on 3/1/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LargeIntCalculator.h"
#import "LargeNumGenerator.h"
@interface AdditionBenchMark : XCTestCase

@end

@implementation AdditionBenchMark{
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
- (void)test1000Dig {
    test1 = [gen generateLargeIntWithLength:1000];
    test2 = [gen generateLargeIntWithLength:1000];
    [self measureBlock:^{
        result = [calc add:test1 and:test2];
    }];
}
- (void)test10000Dig {
    test1 = [gen generateLargeIntWithLength:10000];
    test2 = [gen generateLargeIntWithLength:10000];
    [self measureBlock:^{
        result = [calc add:test1 and:test2];
    }];
}
- (void)test100000Dig {
    test1 = [gen generateLargeIntWithLength:100000];
    test2 = [gen generateLargeIntWithLength:100000];
    [self measureBlock:^{
        result = [calc add:test1 and:test2];
    }];
}
- (void)test500000Dig {
    test1 = [gen generateLargeIntWithLength:500000];
    test2 = [gen generateLargeIntWithLength:500000];
    [self measureBlock:^{
        result = [calc add:test1 and:test2];
    }];
}
- (void)test1000000Dig {
    test1 = [gen generateLargeIntWithLength:1000000];
    test2 = [gen generateLargeIntWithLength:1000000];
    [self measureBlock:^{
        result = [calc add:test1 and:test2];
    }];
}
- (void)test10000000Dig {
    test1 = [gen generateLargeIntWithLength:10000000];
    test2 = [gen generateLargeIntWithLength:10000000];
    [self measureBlock:^{
        result = [calc add:test1 and:test2];
    }];
}
- (void)test100000000Dig {
    test1 = [gen generateLargeIntWithLength:100000000];
    test2 = [gen generateLargeIntWithLength:100000000];
    [self measureBlock:^{
        result = [calc add:test1 and:test2];
    }];
}

- (void)testPerformanceExample {

    [self measureBlock:^{

    }];
}

@end
