//
//  LargeIntCalculator.m
//  LargeNumProject
//
//  Created by Xander on 2/17/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import "LargeIntCalculator.h"

@implementation LargeIntCalculator

-(LargeInt *) multiply:(LargeInt *) num1 by:(LargeInt *) num2{
    [self assertEqualBase:num1 hasSameBaseWith:num2];
    LargeInt *result = [[LargeInt alloc] init];
    [self enforceEqualLength:num1 and:num2];
    for(unsigned long long int i = 0; i < [num1 length];i++){
        LargeInt *partialSum = [self singleDigMultiply:num2 mutiplyBy:[num1 getDigitAt:i]];
        [partialSum shiftLeft:i];
        result = [self add:partialSum and:result];
    }
    
    result.isPositive = (num1.isPositive && num2.isPositive) || (!num1.isPositive && !num2.isPositive);
    [result simplify];
    [num1 simplify];
    [num2 simplify];
    return result;
}
-(LargeInt *) singleDigMultiply:(LargeInt *) num mutiplyBy:(int) factor{
    if(factor > 9 || factor < 0)
        [NSException raise:@"Single Digit Multiply factor out of range 0..9" format:@"Your factor is %i",factor];
    
    LargeInt *result = [[LargeInt alloc] init];
    int carry = 0;
    for(unsigned long long int i = 0; i < [num length]; i++){
        int tempResult = [num getDigitAt:i] * factor + carry;
        
        if(tempResult >= num.base){
            carry = tempResult / num.base;
            tempResult = tempResult%num.base;
        }else{
            carry = 0;
        }
        [result insertDigitAtMostSigPlace:tempResult];
    }
    if(carry != 0)
        [result insertDigitAtMostSigPlace:carry];
    return result;
}
-(LargeInt *) subtract:(LargeInt*)num1 by:(LargeInt *)num2{
    [self assertEqualBase:num1 hasSameBaseWith:num2];
    // Positive subtrac positive 5-4 = 5-4
    if(num1.isPositive && num2.isPositive){
        //continue to the actual method
    }
    
    // Positive Subtract negative 5 - (-4) == 5+4
    if(num1.isPositive && !num2.isPositive){
        LargeInt *num2_copy = [num2 copy];
        num2_copy.isPositive = YES;
        
        //both positive
        return [self add:num1 and:num2_copy];
    }
    
    // Negative subtract postive -5 - 4 = (-5)+(-4)
    if(!num1.isPositive && num2.isPositive){
        LargeInt *num2_copy = [num2 copy];
        num2_copy.isPositive = NO;
        
        //both negative
        return [self add:num1 and:num2_copy];
    }
    
    // Negative subtract negative -5 - (-4) = 4-5
    if(!num1.isPositive && !num2.isPositive){
        LargeInt *num2_copy = [num2 copy];
        num2_copy.isPositive = YES;
        LargeInt *num1_copy = [num1 copy];
        num1_copy.isPositive = YES;
        
        //Both positive
        return [self subtract:num2_copy by:num1_copy];
    }
    
        
    [self enforceEqualLength:num1 and:num2];
    LargeInt *result = [[LargeInt alloc] init];
    int carry = 0;
    if([num1 isEqualTo:num2]){
        return result;
    }else if([num1 isGreaterThan:num2]){
        [self enforceEqualLength:num1 and:num2];
        for(unsigned long long int i = 0; i < [num1 length]; i++){
            int tempResult;
            if([num2 getDigitAt:i] > [num1 getDigitAt:i] + carry){
                tempResult = [num1 getDigitAt:i] + carry + num1.base - [num2 getDigitAt:i];
                carry = -1;
            }else{
                tempResult = [num1 getDigitAt:i] + carry - [num2 getDigitAt:i];
                carry = 0;
            }
            [result insertDigitAtMostSigPlace:tempResult];
        }
    }else{
        result = [self subtract:num2 by:num1];
        result.isPositive = !result.isPositive;
    }
    [num1 simplify];
    [num2 simplify];
    [result simplify];
    return result;
}

-(LargeInt *) add:(LargeInt *) num1 and:(LargeInt *)num2{
    [self assertEqualBase:num1 hasSameBaseWith:num2];
    // Positive subtrac positive 5+4 = 5+4
    if(num1.isPositive && num2.isPositive){
        //continue to the actual method
    }
    // Negative add negative -5 + (-4) = -(4+5)
    if(!num1.isPositive && !num2.isPositive){
        //continue to the actual method
    }
    
    // Positive add negative 5 + (-4) == 5-4
    if(num1.isPositive && !num2.isPositive){
        LargeInt *num2_copy = [num2 copy];
        num2_copy.isPositive = YES;
        return [self subtract:num1 by:num2_copy];
    }
    
    // Negative add postive -5 + 4 = 4-5
    if(!num1.isPositive && num2.isPositive){
        LargeInt *num1_copy = [num1 copy];
        num1_copy.isPositive = YES;
        return [self add:num2 and:num1_copy];
    }

    [self enforceEqualLength:num1 and:num2];
    int carry = 0;
    LargeInt *result = [[LargeInt alloc] init];
    for(unsigned long long int i = 0; i < [num1 length]; i++){
        int sum = [num1 getDigitAt:i]+[num2 getDigitAt:i]+carry;
        if(sum >= num1.base){
            carry = 1;
            sum -= num1.base;
        }else{
            carry = 0;
        }
        [result insertDigitAtMostSigPlace:sum];
    }
    if(carry != 0)
        [result insertDigitAtMostSigPlace:carry];
    [result simplify];
    [num1 simplify];
    [num2 simplify];
    //We checked if they are both pos or both neg, so set it to one of them
    result.isPositive = num1.isPositive;
    return result;
    
}
-(LargeInt *) divide:(LargeInt*) numerator by:(LargeInt *)denominator{
    if([denominator isGreaterThan:numerator])
        return [[LargeInt alloc] initFromInt:0];
    if([denominator isEqual:numerator])
        return [[LargeInt alloc] initFromInt:1];
    
    
    
    
    
    return nil;
}


-(int) singleDigQDivide:(LargeInt *) numerator by:(LargeInt *)denominator{
    if([numerator isZero])
        [NSException raise:@"Cannot divide 0!" format:@""];
    for(int i = 0; i <= 9; i++){
        LargeInt *newProduct = [self multiply:[[LargeInt alloc] initFromInt:i+1] by:denominator];
        if([newProduct isGreaterThan:numerator]){
            return i;
        }
    }
    [NSException raise:@"Invalid Single Dig Q division" format:@""];
    return -1;
}
-(void) assertEqualBase:(LargeInt *)num1 hasSameBaseWith:(LargeInt *)num2{
        if(num1.base != num2.base)
            [NSException raise:@"bases of two operands of addition are different" format:@"num1's base: %i, num2's base:%i",num1.base,num2.base];
}
-(void) addOne:(LargeInt *) num1{
    int i = 0;
    while( i < [num1 length]){
        int newDig = [num1 getDigitAt:i]+1;
        
        if(newDig == num1.base){
            [num1 setDigitAt:i withValue:0];
        }else{
            [num1 setDigitAt:i withValue:newDig];
            return;
        }
        i++;
    }
    [num1 insertDigitAtMostSigPlace:1];
}

-(void) enforceEqualLength:(LargeInt *) num1 and:(LargeInt *) num2{
    unsigned long long int length1 = [num1 length];
    unsigned long long int length2 = [num2 length];
    if(length1 > length2)
        [num2 zeroExtend:length1];
    else
        [num1 zeroExtend:length2];
}
@end
