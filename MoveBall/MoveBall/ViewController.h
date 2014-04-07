//
//  ViewController.h
//  MoveBall
//
//  Created by Mital Jani on 4/7/14.
//  Copyright (c) 2014 Mital Jani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{ UIImage* ballImage;
}

@property (nonatomic, retain) UIImage* ballImage;
-(void) onTimer;
- (void) onAnimationComplete: (NSString *) animationId finished: (NSNumber *) finsied context: (void *) context;
@property (strong, nonatomic) IBOutlet UIView *ballview;

@end
