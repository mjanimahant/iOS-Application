//
//  ViewController.h
//  SimpleGUIApp
//
//  Created by Mital Jani on 1/23/14.
//  Copyright (c) 2014 Mital Jani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *TextArea;
@property (weak, nonatomic) IBOutlet UILabel *OutputArea;
- (IBAction)RedButton:(UIButton *)sender;
- (IBAction)YellowButton:(UIButton *)sender;
- (IBAction)GreenButton:(UIButton *)sender;
- (IBAction)TheText:(UITextField *)sender;

@end
