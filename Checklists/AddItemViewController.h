//
//  AddItemViewController.h
//  Checklists
//
//  Created by Xiang on 15/4/12.
//  Copyright (c) 2015年 X-Company. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddItemViewController;
@class ChecklistItem;

@protocol AddItemViewControllerDelegate <NSObject>

- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller;
- (void)addItemViewController:(AddItemViewController *)controller didFinishAddingItem:(ChecklistItem *)item;
- (void)addItemViewController:(AddItemViewController *)controller didFinishEditingItem:(ChecklistItem *)item;

@end

@interface AddItemViewController : UITableViewController<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, weak) id <AddItemViewControllerDelegate> delegate;
@property (nonatomic, strong) ChecklistItem *itemToEdit;

@end
