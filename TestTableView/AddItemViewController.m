//
//  AddItemViewController.m
//  TestTableView
//
//  Created by Hardeep Singh on 11/20/14.
//  Copyright (c) 2014 Hardeep Singh. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

@synthesize addItemName, addItemQnty, addItemParentViewController;
- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)addItemButtonPressed:(id)sender {
    NSLog(@"this is value");
    //[self dismissViewControllerAnimated:YES completion:nil];
   // [self.navigationController pushViewController: addItemParentViewController animated:YES];
    
    //[self presentViewController:addItemParentViewController animated:YES completion:nil];
    //[self.navigationController loadView]
    //[self dismissViewControllerAnimated:<#(BOOL)#> completion:<#^(void)completion#>]
    [self.navigationController popToViewController:addItemParentViewController animated:YES];
    [addItemParentViewController actionAddItem: [NSMutableDictionary dictionaryWithObjectsAndKeys: addItemName.text , ITEMNAME, addItemQnty.text, ITEMQNTY, nil] ];
    
}
@end
