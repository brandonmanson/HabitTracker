//
//  HabitTableTableViewController.m
//  HabitTracker
//
//  Created by Srinivas Bodhanampati on 6/3/16.
//  Copyright © 2016 Srinivas Bodhanampati. All rights reserved.
//

#import "HabitTableTableViewController.h"
#import "DetailViewController.h"

@interface HabitTableTableViewController ()

@end

@implementation HabitTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createHabitsArray];
    NSLog(@"%@", _habits);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createHabitsArray {
    Habit *habitOne = [[Habit alloc]initWithHabitName:@"Meditate" andDescription:@"Spend ten minutes meditating"];
    Habit *habitTwo = [[Habit alloc]initWithHabitName:@"Run" andDescription:@"Train up for that 5k"];
    Habit *habitThree = [[Habit alloc]initWithHabitName:@"Code" andDescription:@"Write some damn code"];
    _habits = [NSArray arrayWithObjects:habitOne, habitTwo, habitThree, nil];
}

- (void)updateForCompletionOfHabit:(Habit *)habit inCell:(UITableViewCell *)cell {
    cell.backgroundColor = [UIColor greenColor];
    cell.textLabel.textColor = [UIColor blackColor];
    
    NSDictionary *attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
    NSAttributedString *completedHabitText = [[NSAttributedString alloc]initWithString:habit.habitName attributes:attributes];
    cell.textLabel.attributedText = completedHabitText;
}

- (void)updateForIncompletionOfHabit:(Habit *)habit inCell:(UITableViewCell *)cell {
    cell.backgroundColor = [UIColor redColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.textLabel.attributedText = nil;
    cell.textLabel.text = habit.habitName;
}

- (void)updateUIOfCell:(UITableViewCell *)cell withPropertiesOfHabit:(Habit *)habit {
    cell.textLabel.text = habit.habitName;
    if (habit.completionStatus) {
        [self updateForCompletionOfHabit:habit inCell:cell];
    } else {
        [self updateForIncompletionOfHabit:habit inCell:cell];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_habits count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Habit *habitInCell = [_habits objectAtIndex:indexPath.row];
    cell.textLabel.text = habitInCell.habitName;
    [self updateUIOfCell:cell withPropertiesOfHabit:habitInCell];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

- (IBAction)unwindToTableView:(UIStoryboardSegue *)segue {
        DetailViewController *habitDetailViewController = (DetailViewController *)segue.sourceViewController;
        _indexOfHabitToUpdate = habitDetailViewController.indexInTableViewToUpdate;
        Habit *habitToUpdate = [_habits objectAtIndex:_indexOfHabitToUpdate.row];
        habitToUpdate.completionStatus = YES;
        [self.tableView reloadData];
        NSLog(@"reloadData called");
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    DetailViewController *vc = [segue destinationViewController];
    NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
    vc.habit = [_habits objectAtIndex:selectedRowIndex.row];
    vc.indexInTableViewToUpdate = selectedRowIndex;
    
}


@end
