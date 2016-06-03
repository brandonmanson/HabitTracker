//
//  DetailViewController.h
//  HabitTracker
//
//  Created by Srinivas Bodhanampati on 6/3/16.
//  Copyright © 2016 Srinivas Bodhanampati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Habit.h"

@interface DetailViewController : UIViewController

@property(nonatomic,strong)Habit *habit;

- (void)updateLabels;


@end
