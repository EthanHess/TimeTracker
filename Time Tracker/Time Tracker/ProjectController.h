//
//  ProjectController.h
//  Time Tracker
//
//  Created by Ethan Hess on 5/14/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"

@interface ProjectController : NSObject

@property (nonatomic, strong) NSArray *projects;

+ (ProjectController *)sharedInstance;

- (void)addProject:(Project *)project;

- (void)removeProject:(Project *)project;

@end
