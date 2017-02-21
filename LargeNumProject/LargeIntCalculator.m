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

#warning this does not handle negative case
-(LargeInt *) add:(LargeInt *) num1 and:(LargeInt *)num2{
//    if(num1.base != num2.base)
//        [NSException raise:@"base of two operands of addition is different" format:@""];
    
    if ((num1.isPositive && num2.isPositive) || (!num1.isPositive && !num2.isPositive)){
        //If they're both positive or both negative
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
    }else{
        // One of the number is negative
        return nil;
    }
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
