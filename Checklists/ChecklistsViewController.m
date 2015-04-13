//
//  ViewController.m
//  Checklists
//
//  Created by Xiang on 15/4/8.
//  Copyright (c) 2015年 X-Company. All rights reserved.
//

#import "ChecklistsViewController.h"
#import "ChecklistItem.h"
@interface ChecklistsViewController ()

@end

@implementation ChecklistsViewController{
    NSMutableArray *_items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.rowHeight = 44;
    _items = [[NSMutableArray alloc] initWithCapacity:20];
    
    ChecklistItem *item;
    item = [[ChecklistItem alloc] init];
    item.text = @"Item One";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ChecklistItem alloc]init];
    item.text = @"Item Two";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ChecklistItem alloc] init];
    item.text = @"Item Three";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ChecklistItem alloc] init];
    item.text = @"Item Four";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ChecklistItem alloc] init];
    item.text = @"Item Five";
    item.checked = NO;
    [_items addObject: item];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"in tableView:numberOfRowsInSection");
    return [_items count];
}

- (void)configureCheckmarkForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item {
    UILabel *label = (UILabel *)[cell viewWithTag:1001];
    if (item.checked) {
        label.text = @"√";
    } else {
        label.text = @"";
    }
}

- (void)configureTextForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item {
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.text;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"in tableView:cellForRowAtIndexPath");
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    ChecklistItem *item = _items[indexPath.row];
    [self configureTextForCell:cell withChecklistItem:item];
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    ChecklistItem *item = _items[indexPath.row];
    [item toggleChecked];
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_items removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addItemViewController:(AddItemViewController *)controller didFinishAddingItem:(ChecklistItem *)item {
    NSInteger newRowIndex = [_items count];
    [_items addObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addItemViewController:(AddItemViewController *)controller didFinishEditingItem:(ChecklistItem *)item {
    NSInteger index = [_items indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    [self configureTextForCell:cell withChecklistItem:item];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddItemViewController *controller = (AddItemViewController *)navigationController.topViewController;
        controller.delegate = self;
    } else if ([segue.identifier isEqualToString:@"EditItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddItemViewController *controller = (AddItemViewController *)navigationController.topViewController;
        controller.delegate = self;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        controller.itemToEdit = _items[indexPath.row];
    }
}
@end
