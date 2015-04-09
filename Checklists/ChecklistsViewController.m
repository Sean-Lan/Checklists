//
//  ViewController.m
//  Checklists
//
//  Created by Xiang on 15/4/8.
//  Copyright (c) 2015年 X-Company. All rights reserved.
//

#import "ChecklistsViewController.h"

@interface ChecklistsViewController ()

@end

@implementation ChecklistsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    if (indexPath.row%5 == 0) {
        label.text = @"我是蓝翔第一行";
    } else if (indexPath.row%5 == 1) {
        label.text = @"我是蓝翔第二行";
    } else if (indexPath.row%5 == 2) {
        label.text = @"我是蓝翔第三行";
    } else if (indexPath.row%5 == 3) {
        label.text = @"我是蓝翔第四行";
    } else if (indexPath.row%5 == 4) {
        label.text = @"我是蓝翔第五行";
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
