//
//  HabitTableTableViewController.h
//  HabitTracker
//
//  Created by Srinivas Bodhanampati on 6/3/16.
//  Copyright © 2016 Srinivas Bodhanampati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Habit.h"

@interface HabitTableTableViewController : UITableViewController

@property(strong, nonatomic)NSArray *habits;
@property(strong, nonatomic)NSIndexPath *indexOfHabitToUpdate;

- (void)createHabitsArray;
- (void)updateUIOfCell:(UITableViewCell *)cell withPropertiesOfHabit:(Habit *)habit;
- (void)updateForCompletionOfHabit:(Habit *)habit inCell:(UITableViewCell *)cell;
- (void)updateForIncompletionOfHabit:(Habit *)habit inCell:(UITableViewCell *)cell;


@end
