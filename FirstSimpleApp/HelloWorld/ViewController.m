//
//  ViewController.m
//  HelloWorld
//
//  Created by Mital Jani on 1/15/14.
//  Copyright (c) 2014 Mital Mahant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize ThingOne, ThingTwo, ThingThree;
@synthesize ButtonOne, ButtonTwo, ButtonThree;
@synthesize NameField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonOneClick:(UIButton *)sender {
    [ThingOne setText:@"Duck is Pressed"];
    
    // in C++ and Java Style
    ButtonOne.hidden = TRUE;
    
    
}

- (IBAction)ButtonTwoClick:(UIButton *)sender {
    [ThingTwo setText:@"Elephant is Pressed"];
}

- (IBAction)ButtonThreeClick:(UIButton *)sender {
    [ThingOne setText:@"Button Three Pressed"];
    ButtonOne.hidden = false;
}

- (IBAction)NameEntered:(UITextField *)sender {
    [ThingThree setText:NameField.text];
    [NameField resignFirstResponder];
}
@end
