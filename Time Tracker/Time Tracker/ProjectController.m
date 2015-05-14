//
//  ProjectController.m
//  Time Tracker
//
//  Created by Ethan Hess on 5/14/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ProjectController.h"

static NSString * const projectListKey = @"projectList";

@implementation ProjectController

+ (ProjectController *)sharedInstance {
    static ProjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ProjectController new];
    });
    
    return sharedInstance;
    
}

- (void)setProjects:(NSArray *)projects {
    
    self.projects = projects;
    
    [self save];
}


- (void)addProject:(Project *)project {
    
    if (!project) {
        
        return;
    }

    NSMutableArray *mutableProjects = [[NSMutableArray alloc] initWithArray:self.projects];
    [mutableProjects addObject:project];
    
    self.projects = mutableProjects;
    
}


- (void)removeProject:(Project *)project {
    
    if (!project) {
        
        return;
    }
    
    NSMutableArray *mutableProjects = self.projects.mutableCopy;
    [mutableProjects removeObject:project];
    
    self.projects = mutableProjects;
}

- (void)loadFromDefaults {
    
    NSArray *projectDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:projectListKey];
    
    NSMutableArray *projects = [NSMutableArray new];
    for (NSDictionary *project in projectDictionaries) {
        [projects addObject:[[Project alloc] initWithDictionary:project]];
    }
    
    self.projects = projects;
}

- (void)save {
    
    NSMutableArray *projects = [NSMutableArray new];
    for (Project *project in self.projects) {
        [projects addObject:[project projectDictionary]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:projects forKey:projectListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

@end
