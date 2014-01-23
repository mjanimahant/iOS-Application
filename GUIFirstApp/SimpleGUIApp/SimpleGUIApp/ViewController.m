//
//  ViewController.m
//  SimpleGUIApp
//
//  Created by Mital Jani on 1/23/14.
//  Copyright (c) 2014 Mital Jani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize TextArea,OutputArea;

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

- (IBAction)RedButton:(UIButton *)sender {
    self.view.backgroundColor = [UIColor redColor];
}

- (IBAction)YellowButton:(UIButton *)sender {
    self.view.backgroundColor = [UIColor yellowColor];
}

- (IBAction)GreenButton:(UIButton *)sender {
    self.view.backgroundColor = [UIColor greenColor];
}

- (IBAction)TheText:(UITextField *)sender {
    [TextArea resignFirstResponder];
    [OutputArea setText:[TextArea text]];
    
}
@end
