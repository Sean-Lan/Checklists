//
//  AddItemViewController.h
//  Checklists
//
//  Created by Xiang on 15/4/12.
//  Copyright (c) 2015年 X-Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddItemViewController : UITableViewController<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
