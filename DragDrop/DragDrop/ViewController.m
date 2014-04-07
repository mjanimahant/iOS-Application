//
//  ViewController.m
//  DragDrop
//
//  Created by Mital Jani on 4/7/14.
//  Copyright (c) 2014 Mital Jani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize dragObject, dropTarget, touchOffset,homePosition;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([touches count] == 1) {
        // one finger
        CGPoint touchPoint = [[touches anyObject]
                              locationInView:self.view];
        for (UIImageView *iView in self.view.subviews) {
            if ([iView isMemberOfClass:[UIImageView class]]) {
                if (touchPoint.x > iView.frame.origin.x &&
                    touchPoint.x < iView.frame.origin.x +
                    iView.frame.size.width &&
                    touchPoint.y > iView.frame.origin.y &&
                    touchPoint.y < iView.frame.origin.y +
                    iView.frame.size.height)
                {
                    self.dragObject = iView;
                    self.touchOffset = CGPointMake(touchPoint.x -
                                                   iView.frame.origin.x,
                                                   touchPoint.y - iView.frame.origin.y);
                    self.homePosition = CGPointMake(iView.frame.origin.x,  iView.frame.origin.y);
                    [self.view bringSubviewToFront:self.dragObject];
                }
            }
        }
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject]
                          locationInView:self.view];
    CGRect newDragObjectFrame = CGRectMake(touchPoint.x - touchOffset.x,
        touchPoint.y - touchOffset.y,
        self.dragObject.frame.size.width,
        self.dragObject.frame.size.height);
    self.dragObject.frame = newDragObjectFrame;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{ 
    CGPoint touchPoint = [[touches anyObject] 
                          locationInView:self.view]; 
    if (touchPoint.x > self.dropTarget.frame.origin.x && 
        touchPoint.x < self.dropTarget.frame.origin.x + 
        self.dropTarget.frame.size.width && 
        touchPoint.y > self.dropTarget.frame.origin.y && 
        touchPoint.y < self.dropTarget.frame.origin.y + 
        self.dropTarget.frame.size.height ) 
    { 
        self.dropTarget.backgroundColor = 
        self.dragObject.backgroundColor; 
        
    } 
    self.dragObject.frame = CGRectMake(self.homePosition.x, 
    self.homePosition.y,
    self.dragObject.frame.size.width,
                                       self.dragObject.frame.size.height); 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
