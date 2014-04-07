//
//  ViewController.m
//  Animate
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
        UIImageView*animationView = [[UIImageView alloc]
                                     initWithFrame:self.view.frame];
        animationView.animationImages = [NSArray arrayWithObjects:
                                         [UIImage imageNamed:@"1.gif"],
                                         [UIImage imageNamed:@"2.gif"],
                                         [UIImage imageNamed:@"3.gif"],
                                         [UIImage imageNamed:@"4.gif"],
                                         [UIImage imageNamed:@"5.gif"],
                                         [UIImage imageNamed:@"6.gif"], nil];
        
        animationView.animationDuration = 1.25;
        animationView.animationRepeatCount = 0;
        [animationView startAnimating];
        [self.view addSubview:animationView];
    }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
