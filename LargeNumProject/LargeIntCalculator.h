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


-(LargeInt *) add:(LargeInt *) num1 and:(LargeInt *)num2;
-(void) addOne:(LargeInt *) num1;
-(LargeInt *) singleDigMultiply:(LargeInt *) num mutiplyBy:(int) factor;
-(LargeInt *) multiply:(LargeInt *) num1 by:(LargeInt *) num2;
@end
