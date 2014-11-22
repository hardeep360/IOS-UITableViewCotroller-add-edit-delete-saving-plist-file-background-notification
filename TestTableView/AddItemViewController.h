//
//  AddItemViewController.h
//  TestTableView
//
//  Created by Hardeep Singh on 11/20/14.
//  Copyright (c) 2014 Hardeep Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
@interface AddItemViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *addItemName;
@property (weak, nonatomic) IBOutlet UITextField *addItemQnty;
@property (weak,nonatomic) TableViewController *addItemParentViewController;
- (IBAction)addItemButtonPressed:(id)sender;

@end
