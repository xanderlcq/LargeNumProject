//
//  ViewController.m
//  LargeNumProject
//
//  Created by Xander on 2/14/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import "ViewController.h"
#import "LargeInt.h"
#import "LargeNumGenerator.h"
#import "LargeIntCalculator.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.calc = [[LargeIntCalculator alloc] init];
    LargeInt *test = [[LargeInt alloc] initFromString:@"12345"];
    NSLog(@"%@",test);

}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)addButton:(id)sender {
    [self calculate:1];
}

- (IBAction)minusButton:(id)sender {
     [self calculate:2];
}
- (IBAction)modButton:(id)sender {
     [self calculate:5];
}

- (IBAction)multiplyButton:(id)sender {
     [self calculate:3];
}

- (IBAction)divideButton:(id)sender {
     [self calculate:4];
}

- (IBAction)facButton:(id)sender {
     [self calculate:6];
}
-(void) calculate:(int) opCode{
    @try{
    LargeInt *result;
    if(opCode == 6){
        if([self isAllDigit:[self.num1Input stringValue]]){
            LargeInt *num1 = [[LargeInt alloc] initFromString:[self.num1Input stringValue]];
            result = [self.calc factorial:num1];
            [self.resultOutlet setStringValue:[result description]];
            return;
        }
    }
    if(
    [self isAllDigit:[self.num1Input stringValue]]&&
       [self isAllDigit:[self.num2Input stringValue]]){
        LargeInt *num1 = [[LargeInt alloc] initFromString:[self.num1Input stringValue]];
        LargeInt *num2 = [[LargeInt alloc] initFromString:[self.num2Input stringValue]];
        switch (opCode) {
            case 1:
                result = [self.calc add:num1 and:num2];
                break;
            case 2:
                result = [self.calc subtract:num1 by:num2];
                break;
            case 3:
                result = [self.calc multiply:num1 by:num2];
                break;
            case 4:
                result = [self.calc divide:num1 by:num2];
                break;
            case 5:
                result = [self.calc remainder:num1 modBy:num2];
                break;

            default:
                break;
        }
        [self.resultOutlet setStringValue:[result description]];
        return;
    }else{
        [self.resultOutlet setStringValue:@"invalid input"];
    }
    }@catch (NSException *exception){
        [self.resultOutlet setStringValue:[NSString stringWithFormat:@"Exception name: %@, Details: %@",exception.name,exception.reason]];
        
    }
    
    
}
-(BOOL) isAllDigit:(NSString *) str{
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([str rangeOfCharacterFromSet:notDigits].location == NSNotFound)
    {
        return YES;
    }
    return NO;
}
@end
