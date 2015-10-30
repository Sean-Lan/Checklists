//
//  IconPickerViewController.h
//  Checklists
//
//  Created by Xiang on 10/29/15.
//  Copyright © 2015 X-Company. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IconPickerViewController;

@protocol IconPickerViewControllerDelegate <NSObject>

- (void)iconPicker:(IconPickerViewController *)picker didPickIcon:(NSString *)iconName;

@end

@interface IconPickerViewController : UITableViewController

@property(nonatomic, weak)id <IconPickerViewControllerDelegate> delegate;

@end
