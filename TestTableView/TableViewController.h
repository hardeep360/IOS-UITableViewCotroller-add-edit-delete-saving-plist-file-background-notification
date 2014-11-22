//
//  TableViewController.h
//  TestTableView
//
//  Created by Hardeep Singh on 11/17/14.
//  Copyright (c) 2014 Hardeep Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
//NSString  *const ITEMNAME  = @"itemname";
//NSString *const ITEMQNTY = @"itemqnty";
extern NSString  *const ITEMNAME;
extern NSString  *const ITEMQNTY;


@interface TableViewController : UITableViewController <UIApplicationDelegate>
{
    NSMutableArray *myArr;
    bool buttonToggled;
    NSDictionary *myDict;
    
    
   
}

- (IBAction)changeTableInEditMode:(id)sender;



-(void) mytestmethod:(NSMutableDictionary *) myvalue;
-(void) actionAddItem:(NSMutableDictionary *) myDictionary;


@end
