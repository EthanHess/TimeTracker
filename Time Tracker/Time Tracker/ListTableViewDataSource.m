//
//  ListTableViewDataSource.m
//  Time Tracker
//
//  Created by Ethan Hess on 5/14/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ListTableViewDataSource.h"
#import "ProjectController.h"

@implementation ListTableViewDataSource



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    Project *project = [Project new];
    
    cell.textLabel.text = project.title;
    
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [ProjectController sharedInstance].projects.count;
    
}




@end
