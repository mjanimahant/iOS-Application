//
//  ViewController.m
//  SimpleCalculator
//
//  Created by Mital Jani on 1/27/14.
//  Copyright (c) 2014 Mital Jani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize theName;


- (void)viewDidLoad
{   operator = 0;
    current = @"0";
    previous = @"0";
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numButtons:(UIButton *)sender {
    NSString *str = (NSString*)[sender currentTitle];
    if ([current isEqualToString:@"0"])
    {
        current = str;
    } else
    {
        current = [current stringByAppendingString:str];
    }
        [theName setText:current];
    
}


-(void) doEquals
{
    if (operator >=1 && operator <=4) {
        NSDecimalNumber* num1 = 0;
        num1= [NSDecimalNumber decimalNumberWithString:previous];
        NSDecimalNumber* num2 = 0;
        num2 = [NSDecimalNumber decimalNumberWithString:current];
        if (operator == 1)
        {
            num1 = [num1 decimalNumberByAdding:num2];
            current = [NSString stringWithString:[num1 stringValue]];
        }
            else if (operator == 2)
            {
                num1 = [num1 decimalNumberBySubtracting: num2];
                current = [NSString stringWithString:[num1 stringValue]];
            }
            else if (operator == 3)
            {
                num1 = [num1 decimalNumberByMultiplyingBy:num2];
                current = [NSString stringWithString:[num1 stringValue]];
            }
            else if (operator == 4)
            {
                if (![current isEqualToString:@"0"]) {
                    num1 = [num1 decimalNumberByDividingBy:num2];
                    current = [NSString stringWithString:[num1 stringValue]];
                }
                
            }
        [theName setText:current];
        previous = [current copy];
        current = @"0";
        operator = 5;
    }
}
                           
- (IBAction)opButtons:(UIButton *)sender {
    NSString *tmpstr = [current substringFromIndex:([current length] -1)];
    if([tmpstr isEqualToString:@"."])
    {current = (NSString *)[current substringToIndex:([current length]-1)];
        [theName setText:current];
}
    NSString *str = (NSString *) [sender currentTitle];
    if(operator >=1 && operator <=4)
    {
        [self doEquals];
    }
    if (operator !=5) {
        
        previous = [current copy];
        current = @"0";
    }
    if ([str isEqualToString:@"+"]) {
        operator = 1;
    }
    else if ([str isEqualToString:@"-"]){
        operator = 2;
    }
    else if ([str isEqualToString:@"*"]){
        operator = 3;
    }
    else if ([str isEqualToString:@"/"]){
        operator = 4;
    }
}
- (IBAction)decimalButton:(UIButton *)sender {
    NSRange range = [current rangeOfString:@"." options:(NSCaseInsensitiveSearch)];
    if (range.location ==NSNotFound)
    {
        current = [current stringByAppendingString:@"."];
    }
    [theName setText:current];
}

- (IBAction)clrButton:(UIButton *)sender {
    current = @"0";
    previous=@"0";
    operator = 0;
    [theName setText:current];
}

- (IBAction)eqButton:(UIButton *)sender {
    [self doEquals];
}
                           
@end
