//
//  ViewController.h
//  MyDatabase
//
//  Created by Mital Jani on 2/3/14.
//  Copyright (c) 2014 Mital Jani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;

@property (weak, nonatomic) IBOutlet UITextField *theName;
@property (weak, nonatomic) IBOutlet UITextField *theAddress;
@property (weak, nonatomic) IBOutlet UITextField *thePhone;
@property (weak, nonatomic) IBOutlet UILabel *theStatus;
- (IBAction)finished:(UITextField *)sender;

- (IBAction)saveData:(UIButton *)sender;
- (IBAction)findContact:(UIButton *)sender;

@end
