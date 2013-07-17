//
//  MainTableViewController.m
//  VoteMePractice
//
//  Created by Zachary Waleed Saraf on 6/8/13.
//  Copyright (c) 2013 Zachary Waleed Saraf. All rights reserved.
//

#import "MainTableViewController.h"
#import "MainTableViewCell.h"
#import "MainTableViewHeaderView.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        NSLog(@"OKAY");
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        NSLog(@"Okay");
        self.numCells = 10;
        self.cellHeights = [[NSMutableArray alloc] init];
        for (int i = 0; i < self.numCells; i++) {
            [self.cellHeights addObject:[NSNumber numberWithInt:60]];
        }
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.headerView = [[MainTableViewHeaderView alloc] initWithFrame:CGRectMake(0., 0., self.view.bounds.size.width, 100)];
    [self.headerView setBackgroundColor:[UIColor colorWithRed:.98 green:.98 blue:.98 alpha:.92]];
    [self.view addSubview:self.headerView];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.numCells;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 300)];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self.cellHeights objectAtIndex:indexPath.item] floatValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mainTableViewCell";
    MainTableViewCell *cell = (MainTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell setDelegate:self];
    [cell setRowNum:[NSNumber numberWithInt:indexPath.item]];
    
    // Configure the cell...
    
    return cell;
}

-(void)tableCellWasTapped:(MainTableViewCell *)cell
{
    NSLog(@"TABLE CELL WAS TAPPED %d", [[cell rowNum] intValue]);
    if (cell.frame.size.height == 60) {
        [self.cellHeights replaceObjectAtIndex:[[cell rowNum] intValue] withObject:[NSNumber numberWithInt:100]];
        [[self tableView] beginUpdates];
        [[self tableView] endUpdates];
        [cell increaseCellSizeToFit];
    } else {
        [self.cellHeights replaceObjectAtIndex:[[cell rowNum] intValue] withObject:[NSNumber numberWithInt:60]];
        [[self tableView] beginUpdates];
        [[self tableView] endUpdates];
        [cell revertCellSize];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 0) {
        scrollView.contentOffset = CGPointMake(0, 0);
    }
    [self updateHeaderFrame:scrollView];
}

-(void)updateHeaderFrame:(UIScrollView *)scrollView
{
    int heightToChange = (scrollView.contentOffset.y < 60) ? 100 - scrollView.contentOffset.y : 60;
    CGRect headerFrame = self.headerView.frame;
    headerFrame.origin.y = scrollView.contentOffset.y;
    headerFrame.size.height = heightToChange;
    self.headerView.frame = headerFrame;
}

@end
