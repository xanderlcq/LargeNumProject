//
//  ViewController.m
//  LargeNumProject
//
//  Created by Xander on 2/14/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import "ViewController.h"
#import "LargeInt.h"
#import "LargeNumGenerator.h"
#import "LargeIntCalculator.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LargeNumGenerator *gen = [[LargeNumGenerator alloc] init];
    LargeInt *test = [gen generateLargeIntWithLength:5];
    [test setDigitAt:0 withValue:9];
    LargeInt *og = [test copy];
    LargeIntCalculator *calc = [[LargeIntCalculator alloc] init];
    [calc addOne:test];
    NSLog(@"%@ + 1 = %@",og,test);
    
    NSLog(@"=======addition========");
    LargeInt *test1 = [gen generateLargeIntWithLength:15];
    LargeInt *test2 = [gen generateLargeIntWithLength:10];
   
    LargeInt *addResult = [calc add:test1 and:test2];
    NSLog(@"%@",test1);
    NSLog(@"+");
    NSLog(@"%@",test2);
    NSLog(@"=");
    NSLog(@"%@",addResult);
    
    NSLog(@"=======Single dig multiply========");
    test1 = [gen generateLargeIntWithLength:5];
    int factor = 7;
    LargeInt *result = [calc singleDigMultiply:test1 mutiplyBy:factor];
    NSLog(@"%@",test1);
    NSLog(@"*");
    NSLog(@"%i",factor);
    NSLog(@"=");
    NSLog(@"%@",result);
    
    NSLog(@"=======shifting========");
    test1 = [gen generateLargeIntWithLength:5];
    int shifting = 5;
    NSLog(@"%@",test1);
    [test1 shiftLeft:shifting];
    NSLog(@"*");
    NSLog(@"shift left: %i spaces",shifting);
    NSLog(@"=");
    NSLog(@"%@",test1);

    NSLog(@"=======multiply========");
    test1 = [gen generateLargeIntWithLength:54];
    test2 = [gen generateLargeIntWithLength:24];
    
    result = [calc multiply:test1 by:test2];
    NSLog(@"%@",test1);
    NSLog(@"*");
    NSLog(@"%@",test2);
    NSLog(@"=");
    NSLog(@"%@",result);
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
