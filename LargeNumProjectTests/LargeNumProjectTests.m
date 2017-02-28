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

- (void)testLargeIntInit{
    LargeInt *test1 = [[LargeInt alloc] init];
    XCTAssertTrue([test1 getDigitAt:0]==0);
    XCTAssertTrue([test1 getMostSigPlace] == 0);
    XCTAssertTrue([test1 getLeastSigPlace] == 0);
    XCTAssertTrue([test1 length] == 0);
    XCTAssertTrue(test1.isPositive);
    
    test1 = [[LargeInt alloc] initFromInt:1234];
    XCTAssertTrue([[test1 description] isEqualToString: @"1234"]);
    XCTAssertEqual([test1 getDigitAt:2],2);
    XCTAssertEqual([test1 getDigitAt:1],3);
    XCTAssertEqual([test1 getMostSigPlace],1);
    XCTAssertEqual([test1 getLeastSigPlace],4);
    XCTAssertTrue(test1.isPositive);
    
    test1 = [[LargeInt alloc] initFromInt:-1234];
    XCTAssertEqual([test1 getDigitAt:2],2);
    XCTAssertEqual([test1 getDigitAt:1],3);
    XCTAssertEqual([test1 getMostSigPlace],1);
    XCTAssertEqual([test1 getLeastSigPlace],4);
    XCTAssertTrue(!test1.isPositive);
    
    //Same as calling init, does not insert the 0 into the array
    test1 = [[LargeInt alloc] initFromInt:0];
    XCTAssertEqual([test1 getMostSigPlace],0);
    XCTAssertEqual([test1 getLeastSigPlace],0);
    
    [test1 insertDigitAtMostSigPlace:1];
    XCTAssertEqual([test1 getMostSigPlace],1);
    XCTAssertEqual([test1 getLeastSigPlace],1);
}

- (void)testInsertandGet{
    LargeInt *test1 = [[LargeInt alloc] init];
    [test1 insertDigitAtMostSigPlace:0];
    [test1 insertDigitAtMostSigPlace:1];
    [test1 insertDigitAtMostSigPlace:4];
    [test1 insertDigitAtLeastSigPlace:8];
    [test1 insertDigitAt:2 withValue:6];
    XCTAssertTrue([[test1 description] isEqualToString: @"41608"]);
    XCTAssertEqual([test1 getDigitAt:0],8);
    XCTAssertEqual([test1 getDigitAt:1],0);
    XCTAssertEqual([test1 getDigitAt:2],6);
    XCTAssertEqual([test1 getDigitAt:3],1);
    XCTAssertEqual([test1 getDigitAt:4],4);
}

- (void)testIsGreaterThan{
    LargeInt *test1 = [[LargeInt alloc] initFromInt:611];
    LargeInt *test2 = [[LargeInt alloc] initFromInt:500];
    XCTAssertTrue(![test2 isGreaterThan:test1]);
    XCTAssertTrue([test1 isGreaterThan:test2]);
    
    test1 = [[LargeInt alloc] initFromInt:999];
    test2 = [[LargeInt alloc] init];
    XCTAssertTrue(![test2 isGreaterThan:test1]);
    XCTAssertTrue([test1 isGreaterThan:test2]);
    
    test1 = [[LargeInt alloc] initFromInt:9];
    test2 = [[LargeInt alloc] initFromInt:-50];
    XCTAssertTrue(![test2 isGreaterThan:test1]);
    XCTAssertTrue([test1 isGreaterThan:test2]);
    
    test1 = [[LargeInt alloc] initFromInt:4];
    test2 = [[LargeInt alloc] initFromInt:-50];
    XCTAssertTrue(![test2 isGreaterThan:test1]);
    XCTAssertTrue([test1 isGreaterThan:test2]);
    
    test1 = [[LargeInt alloc] initFromInt:-10];
    test2 = [[LargeInt alloc] initFromInt:-50];
    XCTAssertTrue(![test2 isGreaterThan:test1]);
    XCTAssertTrue([test1 isGreaterThan:test2]);
    
    test1 = [[LargeInt alloc] initFromInt:0];
    test2 = [[LargeInt alloc] initFromInt:0];
    XCTAssertTrue(![test2 isGreaterThan:test1]);
    XCTAssertTrue(![test1 isGreaterThan:test2]);
    
    test1 = [[LargeInt alloc] initFromInt:0];
    test2 = [[LargeInt alloc] initFromInt:-50];
    XCTAssertTrue(![test2 isGreaterThan:test1]);
    XCTAssertTrue([test1 isGreaterThan:test2]);
    
    test1 = [[LargeInt alloc] initFromInt:-50];
    test2 = [[LargeInt alloc] initFromInt:-50];
    XCTAssertTrue(![test2 isGreaterThan:test1]);
    XCTAssertTrue(![test1 isGreaterThan:test2]);
}
- (void)testIsLessThan{
    LargeInt *test1 = [[LargeInt alloc] initFromInt:611];
    LargeInt *test2 = [[LargeInt alloc] initFromInt:500];
    XCTAssertTrue([test2 isLessThan:test1]);
    XCTAssertTrue(![test1 isLessThan:test2]);
    
    test1 = [[LargeInt alloc] initFromInt:999];
    test2 = [[LargeInt alloc] init];
    XCTAssertTrue([test2 isLessThan:test1]);
    XCTAssertTrue(![test1 isLessThan:test2]);
    
    test1 = [[LargeInt alloc] initFromInt:9];
    test2 = [[LargeInt alloc] initFromInt:-50];
    XCTAssertTrue([test2 isLessThan:test1]);
    XCTAssertTrue(![test1 isLessThan:test2]);
    
    test1 = [[LargeInt alloc] initFromInt:4];
    test2 = [[LargeInt alloc] initFromInt:-50];
    XCTAssertTrue([test2 isLessThan:test1]);
    XCTAssertTrue(![test1 isLessThan:test2]);
    
    test1 = [[LargeInt alloc] initFromInt:-10];
    test2 = [[LargeInt alloc] initFromInt:-50];
    XCTAssertTrue([test2 isLessThan:test1]);
    XCTAssertTrue(![test1 isLessThan:test2]);
    
    test1 = [[LargeInt alloc] initFromInt:0];
    test2 = [[LargeInt alloc] initFromInt:0];
    XCTAssertTrue(![test2 isLessThan:test1]);
    XCTAssertTrue(![test1 isLessThan:test2]);
    
    test1 = [[LargeInt alloc] initFromInt:0];
    test2 = [[LargeInt alloc] initFromInt:-50];
    XCTAssertTrue([test2 isLessThan:test1]);
    XCTAssertTrue(![test1 isLessThan:test2]);
    
    test1 = [[LargeInt alloc] initFromInt:-50];
    test2 = [[LargeInt alloc] initFromInt:-50];
    XCTAssertTrue(![test2 isLessThan:test1]);
    XCTAssertTrue(![test1 isLessThan:test2]);
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

    
    // This is an example of a performance test case.
    [self measureBlock:^{

    }];
}

@end
