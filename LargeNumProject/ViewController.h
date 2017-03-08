//
//  ViewController.h
//  LargeNumProject
//
//  Created by Xander on 2/14/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LargeIntCalculator.h"
@interface ViewController : NSViewController
@property LargeIntCalculator *calc;
@property LargeInt *num1;
@property LargeInt *num2;


@property (weak) IBOutlet NSTextField *num1Input;
@property (weak) IBOutlet NSTextField *num2Input;
- (IBAction)addButton:(id)sender;
- (IBAction)minusButton:(id)sender;

- (IBAction)modButton:(id)sender;
- (IBAction)multiplyButton:(id)sender;
- (IBAction)divideButton:(id)sender;
- (IBAction)facButton:(id)sender;
@property (weak) IBOutlet NSTextField *resultOutlet;

@end

