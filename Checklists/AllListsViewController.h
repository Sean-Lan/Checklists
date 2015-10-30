//
//  AllListsViewController.h
//  Checklists
//
//  Created by Xiang on 10/27/15.
//  Copyright © 2015 X-Company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"
@class DataModel;
@interface AllListsViewController : UITableViewController<ListDetailViewControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) DataModel* dataModel;
@end
