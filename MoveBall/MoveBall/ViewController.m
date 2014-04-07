//
//  ViewController.m
//  MoveBall
//
//  Created by Mital Jani on 4/7/14.
//  Copyright (c) 2014 Mital Jani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize ballImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.2 blue:
                                 0.18 alpha:1.0];
    ballImage = [UIImage imageNamed:@"imgres.jpg"];
    [NSTimer scheduledTimerWithTimeInterval:(0.08) target:self
                                   selector:@selector(onTimer) userInfo:nil repeats:YES];}
    - (void)onTimer
    {
        UIImageView* ballView = [[UIImageView alloc] initWithImage:ballImage];
        int startX = round(random() % 320);
        int endX = round(random() % 320);
        double scale = 1 / round(random() % 100) + 1.0;
        double speed = 1 / round(random() % 100) + 1.0;
        
        ballView.frame = CGRectMake(startX, -100.0, 25.0 * scale, 25.0 * scale);
        ballView.alpha = 0.25;
        [self.view addSubview:ballView];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:5 * speed];
        ballView.frame = CGRectMake(endX, 500.0, 25.0 * scale, 25.0 * scale);
        [UIView
         setAnimationDidStopSelector:@selector(onAnimationComplete:finished:context:)];
        [UIView setAnimationDelegate:self];
        [UIView commitAnimations];
        
    }
    - (void)onAnimationComplete:(NSString *)animationID finished:(NSNumber 
                                                                  *)finished context:(void *)context {
        // [ballview removeFromSuperview];
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
