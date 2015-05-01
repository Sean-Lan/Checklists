//
//  AllListsViewController.h
//  Checklists
//
//  Created by Xiang on 15/4/21.
//  Copyright (c) 2015年 X-Company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"

@class DataModel;

@interface AllListsViewController : UITableViewController <ListDetailViewControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) DataModel *dataModel;

@end
