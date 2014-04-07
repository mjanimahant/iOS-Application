//
//  ViewController.m
//  MyTicTacToeGame
//
//  Created by Mital Jani on 2/10/14.
//  Copyright (c) 2014 Mital Jani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{ turns = 0;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)squarePress:(UIButton *)sender {
    NSInteger i = [sender tag];
    NSLog(@"test %d", i);
    UIButton *tmpButton = (UIButton *)[self.view viewWithTag:i];
    [tmpButton setImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
    [tmpButton setTag:i+10]; // item can't be selected by computer
    turns++;
    
    if([self checkForWin]) // see for a winner
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You won!" message:@"Great job, you beat the computer!!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        turns=10;
    }
    
    // check to see if there are turns left
    if (turns < 9)
    {
        // randomly select another button for the computer's turn
        int r = arc4random() % 9; // randomly select a number between 0 and 9
        UIButton *compButton = (UIButton *)[self.view viewWithTag:r]; // get the square
        
        // see if the square is selectable. If not, select another one
        while (![[compButton.superview viewWithTag:r] isKindOfClass:[UIButton class]])
        {
            r = arc4random() % 9;
            compButton = (UIButton *)[self.view viewWithTag:r];
        }
        
        [compButton setImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
        [compButton setTag:r+10];
        turns++;
        
        if([self checkForWin]) // see for a winner
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Computer Won!" message:@"You got beat by the computer. Try again!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            turns=10;
        }
    }
}

// method that will check to see if someone has won returns TRUE if someone wins
-(BOOL) checkForWin {
    
    UIButton *Button1 = (UIButton *)[self.view viewWithTag:11];
    UIButton *Button2 = (UIButton *)[self.view viewWithTag:12];
    UIButton *Button3 = (UIButton *)[self.view viewWithTag:13];
    UIButton *Button4 = (UIButton *)[self.view viewWithTag:14];
    UIButton *Button5 = (UIButton *)[self.view viewWithTag:15];
    UIButton *Button6 = (UIButton *)[self.view viewWithTag:16];
    UIButton *Button7 = (UIButton *)[self.view viewWithTag:17];
    UIButton *Button8 = (UIButton *)[self.view viewWithTag:18];
    UIButton *Button9 = (UIButton *)[self.view viewWithTag:19];
    
    
    // HORIZONTAL WINS
	if((Button1.currentImage == Button2.currentImage) & (Button2.currentImage == Button3.currentImage) & (Button1.currentImage != NULL))
	{
		return YES;
	}
	if((Button4.currentImage == Button5.currentImage) & (Button5.currentImage == Button6.currentImage) & (Button4.currentImage != NULL))
	{
		return YES;
	}
	if((Button7.currentImage == Button8.currentImage) & (Button8.currentImage == Button9.currentImage) & (Button7.currentImage != NULL))
	{
		return YES;
	}
	// VERTICAL WINS
	if((Button1.currentImage == Button4.currentImage) & (Button4.currentImage == Button7.currentImage) & (Button1.currentImage != NULL))
	{
		return YES;
	}
	if((Button2.currentImage == Button5.currentImage) & (Button5.currentImage == Button8.currentImage) & (Button2.currentImage != NULL))
	{
		return YES;
	}
	if((Button3.currentImage == Button6.currentImage) & (Button6.currentImage == Button9.currentImage) & (Button3.currentImage != NULL))
	{
		return YES;
	}
	// DIAGONAL WINS
	if((Button1.currentImage == Button5.currentImage) & (Button5.currentImage == Button9.currentImage) & (Button1.currentImage != NULL))
	{
		return YES;
	}
	if((Button3.currentImage == Button5.currentImage) & (Button5.currentImage == Button7.currentImage) & (Button3.currentImage != NULL))
	{
		return YES;
	}
	
	return NO;
}

@end
