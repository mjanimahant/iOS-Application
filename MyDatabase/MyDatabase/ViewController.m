//
//  ViewController.m
//  MyDatabase
//
//  Created by Mital Jani on 2/3/14.
//  Copyright (c) 2014 Mital Jani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize theName, theAddress, thePhone, theStatus, databasePath, contactDB;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *docsDir; NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    // Build the path to the database file
    databasePath = [[NSString alloc]
                     initWithString: [docsDir stringByAppendingPathComponent:@"contacts.db"]];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath ] == NO) {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK) {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)";
            if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                theStatus.text = @"Failed to create table"; }
            sqlite3_close(contactDB);
        } else {
            theStatus.text = @"Failed to open/create database";
        } }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)finished:(UITextField *)sender {
    [sender resignFirstResponder];
}

- (IBAction)saveData:(UIButton *)sender {
    
    sqlite3_stmt *statement;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:
                            @"INSERT INTO CONTACTS (name, address, phone) VALUES (\"%@\", \"%@\", \"%@\")",self.theName.text, self.theAddress.text, self.thePhone.text];
        const char *insert_stmt = [insertSQL UTF8String]; sqlite3_prepare_v2(contactDB, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {self.theStatus.text = @"Contact added"; self.theName.text = @""; self.theAddress.text = @""; self.thePhone.text = @"";
        } else {
            self.theStatus.text = @"Failed to add contact";
        } sqlite3_finalize(statement); sqlite3_close(contactDB);
    } }

- (IBAction)findContact:(UIButton *)sender {
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT address, phone FROM contacts WHERE name=\"%@\"",theName.text];
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW) {
                NSString *addressField = [[NSString alloc]
                                          initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                theAddress.text = addressField; NSString *phoneField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)]; thePhone.text = phoneField; theStatus.text = @"Match found";
            } else {
                theStatus.text = @"Match not found"; theAddress.text = @""; thePhone.text = @"";
            }
            sqlite3_finalize(statement); }
        sqlite3_close(contactDB); }
}

@end
