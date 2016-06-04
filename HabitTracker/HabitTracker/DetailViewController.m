//
//  DetailViewController.m
//  HabitTracker
//
//  Created by Srinivas Bodhanampati on 6/3/16.
//  Copyright © 2016 Srinivas Bodhanampati. All rights reserved.
//

#import "DetailViewController.h"


@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *habitNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *habitDescriptionLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateLabels];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateLabels {
    _habitNameLabel.text = _habit.habitName;
    _habitDescriptionLabel.text = _habit.habitDescription;
}

- (IBAction)completeHabitButtonPressed:(UIButton *)sender {
    
}




#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    

}


@end
