//
//  EditUIViewController.h
//  TestTableView
//
//  Created by Hardeep Singh on 11/20/14.
//  Copyright (c) 2014 Hardeep Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
@interface EditUIViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *itemName;
@property (weak, nonatomic) IBOutlet UITextField *qnty;

@property (weak, nonatomic) NSString *items;
@property (weak,nonatomic) TableViewController *myparentViewController;

- (IBAction)updateItem:(id)sender;

@end
