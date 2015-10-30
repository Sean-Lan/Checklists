//
//  ItemDetailViewController.h
//  Checklists
//
//  Created by Xiang on 10/27/15.
//  Copyright © 2015 X-Company. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemDetailViewController;
@class ChecklistItem;
@protocol ItemDetailViewControllerDelegate <NSObject>
-(void)itemDetailViewControllerDidCancel:(ItemDetailViewController *)controller;
-(void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem*)item;
-(void)itemDetailViewController:(ItemDetailViewController*)controller didFinishEditingItem:(ChecklistItem*)item;
@end

@interface ItemDetailViewController : UITableViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property(nonatomic,weak) id <ItemDetailViewControllerDelegate> delegate;
@property(nonatomic,strong) ChecklistItem *itemToEdit;
@property(nonatomic, weak)IBOutlet UISwitch *switchControl;
@property(nonatomic, weak)IBOutlet UILabel *dueDateLabel;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
@end
