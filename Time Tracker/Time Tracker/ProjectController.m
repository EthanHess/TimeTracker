//
//  ProjectController.m
//  Time Tracker
//
//  Created by Ethan Hess on 5/14/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ProjectController.h"

@implementation ProjectController

+ (ProjectController *)sharedInstance {
    static ProjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ProjectController new];
    });
    
    return sharedInstance;
    
}


- (void)addProject:(Project *)project {
    
    
}

- (void)removeProject:(Project *)project {
    
    
}

- (void)loadFromDefaults {
    
    
}

- (void)save {
    
    
}

@end
