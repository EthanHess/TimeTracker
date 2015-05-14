//
//  Project.m
//  Time Tracker
//
//  Created by Ethan Hess on 5/14/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "Project.h"
#import "ProjectController.h"

static NSString *const titleKey = @"title";
static NSString *const entriesKey = @"entries";

@interface Project ()

@property (nonatomic, strong) Entry *currentEntry;

@end

@implementation Project

- (id)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    
    if (self) {
        
        self.title = dictionary[titleKey];
    
        NSMutableArray *entries = [NSMutableArray new];
        for (NSDictionary *entry in dictionary[entriesKey]) {
            
            [entries addObject:[[Entry alloc] initWithDictionary:entry]];
            
        }
    
        self.entries = entries;
    
    }
    
    return self;
}

- (NSDictionary *)projectDictionary {
    
    NSMutableDictionary *projectDictionary = [NSMutableDictionary new];
    
    if (self.title) {
        [projectDictionary setObject:self.title forKey:titleKey];
    }
    
    NSMutableArray *entries = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        [entries addObject:[entry entryDictionary]];
    }
    
    [projectDictionary setObject:entries forKey:entriesKey];
    
    return projectDictionary;
    
}

- (NSString *)projectTime {
    
    NSInteger *totalHours = 0;
    NSInteger *totalMinutes = 0;
    
    for (Entry *entry in self.entries) {
        
        NSTimeInterval distanceBetweenDates = [entry.endTime timeIntervalSinceDate:entry.startTime];
        
        double secondsInHour = 3600;
        NSInteger hoursBetweenDates = distanceBetweenDates / secondsInHour;
        
        double secondsInMinute = 60;
        NSInteger minutesBetweenDates = (distanceBetweenDates - (hoursBetweenDates * secondsInHour)) / secondsInMinute;
        
        totalHours += hoursBetweenDates;
        totalMinutes += minutesBetweenDates;
    }
    
    NSString *hourString = totalHours < 10 ? [NSString stringWithFormat:@"0%ld", (long)totalHours] : [NSString stringWithFormat:@"%ld", (long)totalHours];
    NSString *minuteString = totalMinutes < 10 ? [NSString stringWithFormat:@"0%ld", (long)totalMinutes] : [NSString stringWithFormat:@"%ld", (long)totalMinutes];
    
    return [NSString stringWithFormat:@"%@:%@", hourString, minuteString];
}

- (void)save {
    
    [[ProjectController sharedInstance] save];
    
}

- (void)setEntries:(NSArray *)entries {
    _entries = entries;
    
    [self save];
}

- (void)startNewEntry {
    
    Entry *entry = [Entry new];
    entry.startTime = [NSDate date];
    
    self.currentEntry = entry;
    
    [self addEntry:entry];
    
}

- (void)endCurrentEntry {
    
    self.currentEntry.endTime = [NSDate date];
    [self save];
    
}


- (void)addEntry:(Entry *)entry {
    
    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEnries = [[NSMutableArray alloc] initWithArray:self.entries];
    [mutableEnries addObject:entry];
    
    self.entries = mutableEnries;
    
}

- (void)removeEntry:(Entry *)entry {
    
    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEntries = self.entries.mutableCopy;
    [mutableEntries removeObject:entry];
    
    self.entries = mutableEntries;
    
}


@end
