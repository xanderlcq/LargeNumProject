//
//  LargeNumGenerator.h
//  LargeNumProject
//
//  Created by Xander on 2/15/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LargeInt.h"

@interface LargeNumGenerator : NSObject
- (LargeInt *)generateLargeIntWithLength:(unsigned long long int)length;
@end
