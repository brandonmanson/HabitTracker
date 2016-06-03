//
//  Habit.m
//  HabitTracker
//
//  Created by Srinivas Bodhanampati on 6/3/16.
//  Copyright © 2016 Srinivas Bodhanampati. All rights reserved.
//

#import "Habit.h"

@implementation Habit

-(id)initWithHabitName:(NSString *)habitName andDescription:(NSString *)description {
    self = [super init];
    if (self) {
        _habitName = habitName;
        _habitDescription = description;
        _completionStatus = NO;
    }
    return self;
    
}


+(id)initWithHabitName:(NSString *)habitName andDescription:(NSString *)description {
    
    return [[super alloc]initWithHabitName:habitName andDescription:description];
    
}

@end
