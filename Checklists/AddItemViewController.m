//
//  AddItemViewController.m
//  Checklists
//
//  Created by Xiang on 15/4/12.
//  Copyright (c) 2015年 X-Company. All rights reserved.
//

#import "AddItemViewController.h"
#import "ChecklistItem.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 44;
    if (self.itemToEdit != nil) {
        self.title = @"Edit Item";
        self.textField.text = self.itemToEdit.text;
        self.doneBarButton.enabled = YES;
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self.delegate addItemViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
//    NSLog(@"Current input is: %@.\n",self.textField.text);
    if (self.itemToEdit == nil) {
        ChecklistItem *item = [[ChecklistItem alloc] init];
        item.text = self.textField.text;
        item.checked = NO;
        [self.delegate addItemViewController:self didFinishAddingItem:item];
    } else {
        self.itemToEdit.text = self.textField.text;
        [self.delegate addItemViewController:self didFinishEditingItem:self.itemToEdit];
    }
    

}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    NSLog(@"position:%lu,length:%lu,string:%@",(unsigned long)range.location, (unsigned long)range.length, string);
    NSString *newText = [self.textField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled = ([newText length]>0);
    return YES;
}
@end
