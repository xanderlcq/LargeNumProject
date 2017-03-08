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
- (id)initFromString:(NSString *)str;

/**
 Initialize a LargeInt object with empty array (so the value is 0)

 @return LargeInt object
 */
- (id)init;


/**
 Initialize a LargeInt object with the givin integer

 @param num Initial number to initialize from

 @return LargeInt object
 */
- (id)initFromInt:(int)num;


/**
 Return the digit at a given index. (note that the least significant bit is at index 0)

 @param index Index of the digit you want to retrieve.

 @return Digit at the given index.
 */
- (int)getDigitAt:(unsigned long long int)index;


/**
 Return the most significant digit

 @return The most significant digit
 */
- (int)getMostSigPlace;


/**
 Return the least significant digit

 @return The least significant digit
 */
- (int)getLeastSigPlace;


/**
 Shift the number certain place to the left. (Add given amount of zeros at the end)

 @param place Places you want to shift
 */
- (void)shiftLeft:(unsigned long long int)place;


/**
 Set digit at given index

 @param index Index of the digit you want to set
 @param value Value of the digit you want to set
 */
- (void)setDigitAt:(unsigned long long int)index withValue:(int)value;


/**
 Insert a digit at most significant place

 @param value The value you want to insert
 */
- (void)insertDigitAtMostSigPlace:(int)value;


/**
 Insert a digit at least significant place

 @param value The value you want to insert
 */
- (void)insertDigitAtLeastSigPlace:(int)value;


/**
 Insert a digit at a given index

 @param index Index of where you want to insert
 @param value The value you want to insert
 */
- (void)insertDigitAt:(unsigned long long int)index withValue:(int)value;


/**
 Returns the number in a string

 @return The number in a string
 */
- (NSString *)description;


/**
 Returns a deep copy of this number

 @return Deep copied LargeInt
 */
- (LargeInt *)copy;


/**
 Returns the length (Number of digits) of this number

 @return The length of this number
 */
- (unsigned long long int)length;


/**
 Checks if this number is zero or not

 @return True if this number is zero
 */
- (BOOL)isZero;


/**
 Simplify the number. (Get rid off all the zeros in the front
 */
- (void)simplify;


/**
 Zero extend the number to a given length without changing the value. (Add zeros in the front)

 @param length Desire length.
 */
- (void)zeroExtend:(unsigned long long int)length;
@end
