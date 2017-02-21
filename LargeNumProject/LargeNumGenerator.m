//
//  LargeNumGenerator.m
//  LargeNumProject
//
//  Created by Xander on 2/15/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import "LargeNumGenerator.h"

@implementation LargeNumGenerator
-(LargeInt *) generateLargeIntWithLength:(unsigned long long int) length{
    LargeInt *number = [[LargeInt alloc] init];
    for(unsigned long long int a = 0; a < length; a++){
        int random = arc4random_uniform(9);
        [number insertDigitAtLeastSigPlace:random];
    }
    return number;
}
@end
