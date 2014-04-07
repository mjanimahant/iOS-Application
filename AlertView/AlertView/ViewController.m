//
//  ViewController.m
//  AlertView
//
//  Created by Mital Jani on 4/7/14.
//  Copyright (c) 2014 Mital Jani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (IBAction)btnTouch:(UIButton *)sender {
    UIAlertView *colorAlert = [[UIAlertView alloc] initWithTitle:@"Change Color" message:@"Choose a Color" delegate:self cancelButtonTitle:@"None" otherButtonTitles:@"Red", @"Yellow", @"Blue", nil];
    [colorAlert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{switch (buttonIndex) {case 1:  //red
    self.view.backgroundColor = [UIColor redColor];
    break;
    case 2:  //yellow
    self.view.backgroundColor = [UIColor yellowColor];break;
    case 3:  //blue
    self.view.backgroundColor = [UIColor blueColor];break;
    default:
    break;}
}

@end
