//
//  ViewController.h
//  SimpleCalculator
//
//  Created by Mital Jani on 1/27/14.
//  Copyright (c) 2014 Mital Jani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int operator;
    NSString *previous;
    NSString *current;
}

@property (weak, nonatomic) IBOutlet UILabel *theName;

- (IBAction)numButtons:(UIButton *)sender;

- (IBAction)opButtons:(UIButton *)sender;

- (IBAction)decimalButton:(UIButton *)sender;

- (IBAction)clrButton:(UIButton *)sender;

- (IBAction)eqButton:(UIButton *)sender;

-(void) doEquals;

@end
