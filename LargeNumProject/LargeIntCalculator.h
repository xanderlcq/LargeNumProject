//
//  LargeIntCalculator.h
//  LargeNumProject
//
//  Created by Xander on 2/17/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LargeInt.h"

@interface LargeIntCalculator : NSObject


/**
 Add number 1 and number 2 (number1 + number2)

 @param num1 number 1
 @param num2 number 2

 @return Sum of number 1 and number 2
 */
- (LargeInt *)add:(LargeInt *)num1 and:(LargeInt *)num2;


/**
 Subtract number1 by number2 (number1 - number2)

 @param num1 number 1
 @param num2 number 2

 @return The difference between number1 and number2
 */
- (LargeInt *)subtract:(LargeInt *)num1 by:(LargeInt *)num2;


/**
 Add one to the number (number++)

 @param num1 the number
 */
- (void)addOne:(LargeInt *)num1;

/**
 multiply number1 by number2 (number1 * number2)
 
 @param num1 number 1
 @param num2 number 2
 
 @return The product of number1 and number2
 */
- (LargeInt *)multiply:(LargeInt *)num1 by:(LargeInt *)num2;

/**
 Integer divide numerator by denominator (numerator / denominator)
 
 @param numerator the numerator
 @param denominator the denominator
 
 @return Integer division quotient of numerator / denominator
 */
- (LargeInt *)divide:(LargeInt *)numerator by:(LargeInt *)denominator;

/**
 Remainder of dividing numerator by denominator (numerator % denominator)
 
 @param numerator the numerator
 @param denominator the denominator
 
 @return Remainder of dividing numerator by denominator
 */
- (LargeInt *)remainder:(LargeInt *)numerator modBy:(LargeInt *)denominator;


/**
 Returns the factorial of the number (number!)

 @param num the number

 @return the factorial of the number
 */
- (LargeInt *)factorial:(LargeInt *)num;
@end
