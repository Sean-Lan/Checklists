//
//  ChecklistItem.m
//  Checklists
//
//  Created by Xiang on 15/4/11.
//  Copyright (c) 2015年 X-Company. All rights reserved.
//

#import "ChecklistItem.h"

@implementation ChecklistItem
-(void)toggleChecked{
    self.checked = !self.checked;
}
@end
