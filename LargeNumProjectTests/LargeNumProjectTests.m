//
//  LargeNumProjectTests.m
//  LargeNumProjectTests
//
//  Created by Xander on 2/14/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LargeInt.h"
#import "LargeNumGenerator.h"
#import "LargeIntCalculator.h"
@interface LargeNumProjectTests : XCTestCase

@end

@implementation LargeNumProjectTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testLargeIntInit{
    
}
- (void)testIsGreaterThan{
    
}
- (void)testIsLessThan{
    
}
- (void)testIsEqual{
    
}
- (void)testAddition{
    
}
- (void)testSubtraction{
    
}
- (void)testMultiply{
    
}
- (void)testDivide{
    
}
- (void)testRemainder{
    
}
- (void)testPerformanceExample {
    LargeIntCalculator *calc = [[LargeIntCalculator alloc] init];
    LargeNumGenerator *gen = [[LargeNumGenerator alloc] init];
    LargeInt *test1 = [gen generateLargeIntWithLength:1000];
    LargeInt *test2 = [gen generateLargeIntWithLength:2000];
    
    // This is an example of a performance test case.
    [self measureBlock:^{
        LargeInt *result = [calc multiply:test1 by:test2];
        // Put the code you want to measure the time of here.
    }];
}

@end
