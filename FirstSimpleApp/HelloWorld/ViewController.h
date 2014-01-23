//
//  ViewController.h
//  HelloWorld
//
//  Created by Mital Jani on 1/15/14.
//  Copyright (c) 2014 Mital Mahant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *ThingOne;
@property (weak, nonatomic) IBOutlet UILabel *ThingTwo;
@property (weak, nonatomic) IBOutlet UILabel *ThingThree;

@property (weak, nonatomic) IBOutlet UIButton *ButtonOne;
@property (weak, nonatomic) IBOutlet UIButton *ButtonTwo;
@property (weak, nonatomic) IBOutlet UIButton *ButtonThree;

@property (weak, nonatomic) IBOutlet UITextField *NameField;


- (IBAction)ButtonOneClick:(UIButton *)sender;
- (IBAction)ButtonTwoClick:(UIButton *)sender;
- (IBAction)ButtonThreeClick:(UIButton *)sender;
- (IBAction)NameEntered:(UITextField *)sender;


@end
