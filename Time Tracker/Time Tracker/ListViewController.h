//
//  ListViewController.h
//  Time Tracker
//
//  Created by Ethan Hess on 5/14/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListTableViewDataSource.h"

@interface ListViewController : UIViewController

@property (nonatomic, strong) ListTableViewDataSource *dataSource;

@end
