//
//  LargeInt.h
//  LargeNumProject
//
//  Created by Xander on 2/14/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LargeInt : NSObject
@property int base;
@property BOOL isPositive;
@property NSMutableArray *data;

-(id) init;
-(id) initFromInt:(int) num;
-(int) getDigitAt:(unsigned long long int)index;
-(int) getMostSigPlace;
-(int) getLeastSigPlace;
-(void) shiftLeft:(unsigned long long int) place;
-(void) setDigitAt:(unsigned long long int)index withValue:(int) value;
-(void) insertDigitAtMostSigPlace:(int)value;
-(void) insertDigitAtLeastSigPlace:(int)value;
-(void) insertDigitAt:(unsigned long long int)index withValue:(int) value;
-(NSString *) description;
-(LargeInt *) copy;
-(unsigned long long int) length;

-(void) simplify;//Get rid of zeros in the front
-(void) zeroExtend:(unsigned long long int) length;
@end
