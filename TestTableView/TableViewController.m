//
//  TableViewController.m
//  TestTableView
//
//  Created by Hardeep Singh on 11/17/14.
//  Copyright (c) 2014 Hardeep Singh. All rights reserved.
//

#import "TableViewController.h"
#import "EditUIViewController.h"
#import "AddItemViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController
{

    NSString* plistPath;
    NSFileManager* manager;
}
NSString  *const ITEMNAME  = @"itemname";
NSString *const ITEMQNTY = @"itemqnty";

- (void) dealloc
{
    // If you don't remove yourself as an observer, the Notification Center
    // will continue to try and send notification objects to the deallocated
    // object.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //[super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    
    plistPath = ([[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Contents/Info.plist"]) ;
     manager = [NSFileManager defaultManager];
    if (  plistPath  )
    {
        myDict = [NSMutableDictionary dictionaryWithContentsOfFile: plistPath ];
        myArr = [NSMutableArray arrayWithObjects: myDict];
    }
    else{
        
        myDict = [NSMutableDictionary dictionaryWithObjectsAndKeys: @"Onion", ITEMNAME, @"20 Kg", ITEMQNTY,  nil];
        
        myArr = [NSMutableArray arrayWithObjects:[NSMutableDictionary dictionaryWithObjectsAndKeys: @"Onion", ITEMNAME, @"20 Kg", ITEMQNTY,  nil], [NSMutableDictionary dictionaryWithObjectsAndKeys: @"Potato", ITEMNAME, @"10 Kg", ITEMQNTY,  nil],[NSMutableDictionary dictionaryWithObjectsAndKeys: @"Chips", ITEMNAME, @"21 Kg", ITEMQNTY,  nil], nil];
    }
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification  object:nil ];
   // NSLog(ITEMNAME);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
   
    
//dictionaryWithObjectsAndKeys:
  //  @"value1", @"key1", @"value2", @"key2", nil
}


-(void) applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"Application enter in background");
    
   
    
    if (  plistPath  )
    {
        if ([manager isWritableFileAtPath:plistPath])
        {
            
            //NSMutableDictionary* infoDict = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
            //[infoDict setObject:[NSNumber numberWithBool:hidden] forKey:@"LSUIElement"];
           // [infoDict writeToFile:plistPath atomically:NO];
           // [manager changeFileAttributes:[NSDictionary dictionaryWithObject:[NSDate date] forKey:NSFileModificationDate] atPath: [[NSBundle mainBundle] bundlePath]];
            
            [myDict writeToFile:plistPath atomically:YES];
            
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
       return myArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    // Configure the cell...
    static NSString *myIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: myIdentifier ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:myIdentifier];
    }
    
    cell.showsReorderControl = YES;
     NSMutableDictionary *myVal =  [myArr objectAtIndex:indexPath.row] ;
   cell.textLabel.text=  [myVal objectForKey:ITEMNAME] ;
    cell.detailTextLabel.text=[myVal objectForKey:ITEMQNTY];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [myArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
       
        //[tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


- (NSIndexPath *)tableView:(UITableView *)tableView
targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {

    return proposedDestinationIndexPath;

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeTableInEditMode:(id)sender {
    if (!buttonToggled) {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self.tableView setEditing:YES animated: YES];

       

        buttonToggled = YES;
        
    }
    else {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        buttonToggled = NO;
                 [self.tableView setEditing:NO animated: YES];
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"EditViewSegue"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EditUIViewController *destViewController = segue.destinationViewController;
        [destViewController setMyparentViewController:self];
       // destViewController.items = [myArr objectAtIndex:indexPath.row ];
        
    }
    else if([segue.identifier isEqualToString:@"addItemSegue"])
    {
       
        AddItemViewController *destViewController = segue.destinationViewController;
        [destViewController setAddItemParentViewController:self];
        // destViewController.items = [myArr objectAtIndex:indexPath.row ];
        
    }
}
-(void) mytestmethod:(NSMutableDictionary *) myvalue{
   // NSLog(myvalue);
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    //NSLog(@"selected tableview row is %d",indexPath.row);
    [myArr replaceObjectAtIndex:indexPath.row withObject:myvalue ];
    [self.tableView reloadData];
    
}

-(void) actionAddItem:(NSMutableDictionary *) myDictionary{
    
    [myArr addObject:myDictionary];
    [self.tableView reloadData];
}
@end
