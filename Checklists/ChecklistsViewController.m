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
    return [_items count];
}

- (void)configureCheckmarkForCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    ChecklistItem *item = _items[indexPath.row];
    if (item.checked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    ChecklistItem *item = _items[indexPath.row];
    label.text = item.text;
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    ChecklistItem *item = _items[indexPath.row];
    item.checked = !item.checked;
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
