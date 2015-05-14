//
//  Project.h
//  Time Tracker
//
//  Created by Ethan Hess on 5/14/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"


@interface Project : NSObject

@property (nonatomic, strong) NSArray *entries;
@property (nonatomic, strong) NSString *title;

- (void)addEntry:(Entry *)entry;

- (void)removeEntry:(Entry *)entry;

- (void)startNewEntry;

- (void)endCurrentEntry;

- (NSString *)projectTime;

- (NSDictionary *)projectDictionary;

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (void)save; 

@end
