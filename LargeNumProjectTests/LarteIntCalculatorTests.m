//
//  LarteIntCalculatorTests.m
//  LargeNumProject
//
//  Created by Xander on 2/28/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LargeInt.h"
#import "LargeIntCalculator.h"
@interface LarteIntCalculatorTests : XCTestCase

@end

@implementation LarteIntCalculatorTests{
    LargeIntCalculator *calc;
    LargeInt *test1;
    LargeInt *test2;
    LargeInt *result;
}

- (void)setUp {
    [super setUp];
    
    calc = [[LargeIntCalculator alloc] init];
    test1 = [[LargeInt alloc] init];
    test2 = [[LargeInt alloc] init];
    result = [[LargeInt alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    calc = nil;
    test1 = nil;
    test2 = nil;
    result = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
}

-(void) testAddOne{
    
}

-(void) testAddition{
    test1 = [[LargeInt alloc] initFromInt:123456789];
    test2 = [[LargeInt alloc] initFromInt:987654321];
    result = [calc add:test1 and:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:1111111110]]);
    
    test1 = [[LargeInt alloc] initFromInt:123456789];
    test2 = [[LargeInt alloc] initFromInt:-987654321];
    result = [calc add:test2 and:test1];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:-864197532]]);
    
    test1 = [[LargeInt alloc] initFromInt:0];
    test2 = [[LargeInt alloc] initFromInt:-987654321];
    result = [calc add:test2 and:test1];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:-987654321]]);
    
    test1 = [[LargeInt alloc] initFromInt:-123456789];
    test2 = [[LargeInt alloc] initFromInt:987654321];
    result = [calc add:test1 and:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:864197532]]);
    
    test1 = [[LargeInt alloc] initFromInt:-123456789];
    test2 = [[LargeInt alloc] initFromInt:-987654321];
    result = [calc add:test1 and:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:-1111111110]]);
}

-(void) testSubtraction{
    
    test1 = [[LargeInt alloc] initFromInt:12345678];
    test2 = [[LargeInt alloc] initFromInt:987654321];
    result = [calc subtract:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:-975308643]]);
    
    test1 = [[LargeInt alloc] initFromInt:12345678];
    test2 = [[LargeInt alloc] initFromInt:987654321];
    result = [calc subtract:test2 by:test1];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:975308643]]);
    
    test1 = [[LargeInt alloc] initFromInt:123456789];
    test2 = [[LargeInt alloc] initFromInt:-987654321];
    result = [calc subtract:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:1111111110]]);
    
    test1 = [[LargeInt alloc] initFromInt:0];
    test2 = [[LargeInt alloc] initFromInt:-987654321];
    result = [calc subtract:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:987654321]]);
    
    test1 = [[LargeInt alloc] initFromInt:-123456789];
    test2 = [[LargeInt alloc] initFromInt:987654321];
    result = [calc subtract:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:-1111111110]]);
    
    test1 = [[LargeInt alloc] initFromInt:-123456789];
    test2 = [[LargeInt alloc] initFromInt:-987654321];
    result = [calc subtract:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:864197532]]);
    
}
-(void) testMultiplication{
    test1 = [[LargeInt alloc] initFromInt:123];
    test2 = [[LargeInt alloc] initFromInt:45678 ];
    result = [calc multiply:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:5618394]]);
    
    test1 = [[LargeInt alloc] initFromInt:-123];
    test2 = [[LargeInt alloc] initFromInt:45678 ];
    result = [calc multiply:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:-5618394]]);
    
    test1 = [[LargeInt alloc] initFromInt:123];
    test2 = [[LargeInt alloc] initFromInt:-45678 ];
    result = [calc multiply:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:-5618394]]);
    
    test1 = [[LargeInt alloc] initFromInt:0];
    test2 = [[LargeInt alloc] initFromInt:-987654321];
    result = [calc multiply:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] init]]);
    
    test1 = [[LargeInt alloc] initFromInt:0];
    test2 = [[LargeInt alloc] initFromInt:987654321];
    result = [calc multiply:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] init]]);
    
    test1 = [[LargeInt alloc] initFromInt:-123];
    test2 = [[LargeInt alloc] initFromInt:-45678];
    result = [calc multiply:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:5618394]]);
}
-(void) testDivision{
    test1 = [[LargeInt alloc] initFromInt:123];
    test2 = [[LargeInt alloc] initFromInt:45678 ];
    result = [calc divide:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:0]]);

    test1 = [[LargeInt alloc] initFromInt:-123];
    test2 = [[LargeInt alloc] initFromInt:45678 ];
    result = [calc divide:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:0]]);
    
    test1 = [[LargeInt alloc] initFromInt:0];
    test2 = [[LargeInt alloc] initFromInt:123];
    result = [calc divide:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:0]]);

    test1 = [[LargeInt alloc] initFromInt:45678];
    test2 = [[LargeInt alloc] initFromInt:123 ];
    result = [calc divide:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:371]]);

    test1 = [[LargeInt alloc] initFromInt:45678];
    test2 = [[LargeInt alloc] initFromInt:-123];
    result = [calc divide:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:-371]]);

    test1 = [[LargeInt alloc] initFromInt:-45678];
    test2 = [[LargeInt alloc] initFromInt:123];
    result = [calc divide:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:-371]]);

    test1 = [[LargeInt alloc] initFromInt:-45678];
    test2 = [[LargeInt alloc] initFromInt:-123];
    result = [calc divide:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:371]]);
    
    test1 = [[LargeInt alloc] initFromInt:123];
    test2 = [[LargeInt alloc] initFromInt:-123];
    result = [calc divide:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:-1]]);
    
    test1 = [[LargeInt alloc] initFromInt:123];
    test2 = [[LargeInt alloc] initFromInt:123];
    result = [calc divide:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:1]]);
    
    test1 = [[LargeInt alloc] initFromInt:-123];
    test2 = [[LargeInt alloc] initFromInt:-123];
    result = [calc divide:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:1]]);
    
    test1 = [[LargeInt alloc] initFromInt:-123];
    test2 = [[LargeInt alloc] initFromInt:123];
    result = [calc divide:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:-1]]);
    
    test1 = [[LargeInt alloc] initFromInt:-27];
    test2 = [[LargeInt alloc] initFromInt:5];
    result = [calc divide:test1 by:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:-5]]);
}
-(void) testMod{
    test1 = [[LargeInt alloc] initFromInt:-270];
    test2 = [[LargeInt alloc] initFromInt:50];
    result = [calc remainder:test1 modBy:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:-20]]);
    
    test1 = [[LargeInt alloc] initFromInt:270];
    test2 = [[LargeInt alloc] initFromInt:50];
    result = [calc remainder:test1 modBy:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:20]]);
    
    test1 = [[LargeInt alloc] initFromInt:270];
    test2 = [[LargeInt alloc] initFromInt:-50];
    result = [calc remainder:test1 modBy:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:20]]);
    
    test1 = [[LargeInt alloc] initFromInt:-270];
    test2 = [[LargeInt alloc] initFromInt:-50];
    result = [calc remainder:test1 modBy:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:-20]]);
    
    test1 = [[LargeInt alloc] initFromInt:2780];
    test2 = [[LargeInt alloc] initFromInt:2780];
    result = [calc remainder:test1 modBy:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:0]]);
    
    test1 = [[LargeInt alloc] initFromInt:278];
    test2 = [[LargeInt alloc] initFromInt:2780];
    result = [calc remainder:test1 modBy:test2];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:278]]);
    
}
-(void) testFactorial{
    test1 = [[LargeInt alloc] initFromInt:10];
    result = [calc factorial:test1];
    XCTAssertTrue([result isEqual:[[LargeInt alloc] initFromInt:3628800]]);
}
@end
