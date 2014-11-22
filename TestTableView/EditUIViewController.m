//
//  EditUIViewController.m
//  TestTableView
//
//  Created by Hardeep Singh on 11/20/14.
//  Copyright (c) 2014 Hardeep Singh. All rights reserved.
//

#import "EditUIViewController.h"


@interface EditUIViewController ()

@end

@implementation EditUIViewController
@synthesize itemName, qnty, items, myparentViewController;
- (void)viewDidLoad {
    [super viewDidLoad];
     NSIndexPath *indexPath = [myparentViewController.tableView indexPathForSelectedRow];
    UITableViewCell *cell = [myparentViewController.tableView cellForRowAtIndexPath:indexPath];
    
    itemName.text= cell.textLabel.text;
    qnty.text = cell.detailTextLabel.text;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)updateItem:(id)sender {
   
   // TableViewController *mainTable =   [[TableViewController alloc] init];
    [self dismissViewControllerAnimated:YES completion:nil];
    //[mainTable mytestmethod:@"Hello world"];
    NSMutableDictionary *myValue = [NSMutableDictionary dictionaryWithObjectsAndKeys: itemName.text, ITEMNAME, qnty.text, ITEMQNTY, nil];
    [myparentViewController  mytestmethod:myValue];
    
}
@end
