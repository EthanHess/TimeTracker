//
//  ListViewController.m
//  Time Tracker
//
//  Created by Ethan Hess on 5/14/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ListViewController.h"
#import "Entry.h"
#import "Project.h"
#import "ProjectController.h"
@import MessageUI;

@interface ListViewController () <UITableViewDelegate, MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, weak) Project *project;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (IBAction)clockinButton:(id)sender {
    
//    [self.project startNewEntry];
//    [self.tableview reloadData];
}

- (IBAction)clockoutButton:(id)sender {
    
//    [self.project endCurrentEntry];
//    [self.tableview reloadData];
}

- (IBAction)reportButton:(id)sender {
    
    MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
    mailViewController.mailComposeDelegate = self;
    
    //Create a message body
    NSString *messageBody;
    
    for (Entry *entry in self.project.entries) {
        
        if (messageBody) {
            messageBody = [NSString stringWithFormat:@"%@\n%@ to %@\n", messageBody, entry.startTime, entry.endTime];
        } else {
            messageBody = [NSString stringWithFormat:@"\n%@ to %@\n", entry.startTime, entry.endTime];
            
        }
    }
    
    //set the message body to the message body string
    [mailViewController setMessageBody:messageBody isHTML:NO];
    
    [self presentViewController:mailViewController animated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
