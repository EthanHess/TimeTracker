//
//  AddEntryViewController.m
//  Time Tracker
//
//  Created by Ethan Hess on 5/14/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "AddEntryViewController.h"

@interface AddEntryViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *projectNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *clockinLabel;
@property (weak, nonatomic) IBOutlet UILabel *clockoutLabel;

@end

@implementation AddEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"New Entry";
}

- (IBAction)saveButton:(id)sender {
    
}

- (IBAction)addProjectTitleTextField:(id)sender {
    
}

- (IBAction)clockinPicker:(id)sender {
    
}

- (IBAction)clockoutPicker:(id)sender {
    
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

@end
