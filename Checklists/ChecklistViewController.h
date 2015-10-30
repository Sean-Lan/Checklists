//
//  ChecklistViewController.h
//  Checklists
//
//  Created by Xiang on 10/27/15.
//  Copyright © 2015 X-Company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"
@class Checklist;
@interface ChecklistViewController : UITableViewController<ItemDetailViewControllerDelegate>

@property(nonatomic, strong) Checklist *checklist;

@end
