//
//  LargeInt.m
//  LargeNumProject
//
//  Created by Xander on 2/14/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import "LargeInt.h"

@implementation LargeInt
// Index 0 is the least significant bit
-(id) init{
    self = [super init];
    if(self){
        self.data = [[NSMutableArray alloc] init];
        self.base = 10;
        self.isPositive = YES;
    }
    return self;
}

-(int) getDigitAt:(unsigned long long int)index{
    if([self length] == 0)
        return 0;
    return [[self.data objectAtIndex:index] intValue];
}
-(int) getMostSigPlace{
    return [self getDigitAt:[self.data count]-1];
}
-(int) getLeastSigPlace{
    return [self getDigitAt:0];
}
-(void) shiftLeft:(unsigned long long int) place{
    while(place > 0){
        [self insertDigitAtLeastSigPlace:0];
        place--;
    }
}
-(void) setDigitAt:(unsigned long long int)index withValue:(int) value{
    if(value > 9 || value < 0)
        [NSException raise:@"set digit value out of bound" format:@"0 <= value <= 9, yours is %i", value];

    if(index >= [self.data count])
        [NSException raise:@"set digit index out of bound" format:@"length of LargeInt: %llu, you're setting at: %llu", (unsigned long long)[self.data count],index];

    [self.data replaceObjectAtIndex:index withObject:[NSNumber numberWithInt:value]];
    
}
-(void) simplify{
    while([self getMostSigPlace] == 0 && [self length] != 0)
        [self.data removeObjectAtIndex:[self.data count]-1];
}
-(void) zeroExtend:(unsigned long long int) length{
    while([self.data count] < length){
        [self insertDigitAtMostSigPlace:0];
    }
}

-(void) insertDigitAt:(unsigned long long int)index withValue:(int) value{
    if(value > 9 || value < 0)
        [NSException raise:@"set digit value out of bound" format:@"0 <= value <= 9, yours is %i", value];
    if(index > [self.data count])
        [NSException raise:@"insert digit index out of bound" format:@"length of LargeInt: %lu, you're setting at: %llu", (unsigned long)[self.data count],index];
    if(index == [self.data count]){
        [self.data addObject:[NSNumber numberWithInt:value]];
        return;
    }
    [self.data insertObject:[NSNumber numberWithInt:value] atIndex:index];
}

-(void) insertDigitAtLeastSigPlace:(int)value{
    [self insertDigitAt:0 withValue:value];
}

-(void) insertDigitAtMostSigPlace:(int)value{
    [self insertDigitAt:[self.data count] withValue:value];
}
-(LargeInt *)copy{
    LargeInt *copy = [[LargeInt alloc] init];
    for(long long int i = 0; i < [self.data count];i++){
        [copy insertDigitAtMostSigPlace:[[self.data objectAtIndex:i] intValue]];
    }
    return copy;
}
-(unsigned long long int) length{
    return [self.data count];
}
-(NSString*)description{
    //Reversing because index 0 is the least significant bit (single dit)
    if([self length] == 0)
        return @"0";
    NSEnumerator *en = [self.data reverseObjectEnumerator];
    return [[en allObjects] componentsJoinedByString:@""];
}
@end
