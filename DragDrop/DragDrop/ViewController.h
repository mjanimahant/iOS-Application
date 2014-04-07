//
//  ViewController.h
//  DragDrop
//
//  Created by Mital Jani on 4/7/14.
//  Copyright (c) 2014 Mital Jani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *dropTarget;
@property (nonatomic, strong) UIImageView *dragObject;

@property (nonatomic, assign) CGPoint touchOffset;
@property (nonatomic, assign) CGPoint homePosition;

@end
