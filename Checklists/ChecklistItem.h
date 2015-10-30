//
//  ChecklistItem.h
//  Checklists
//
//  Created by Xiang on 10/27/15.
//  Copyright © 2015 X-Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChecklistItem : NSObject<NSCoding>
@property(nonatomic, copy)NSString *text;
@property(nonatomic, assign)BOOL checked;
@property(nonatomic, copy)NSDate *dueDate;
@property(nonatomic, assign)BOOL shouldRemind;
@property(nonatomic, assign)NSInteger itemId;
- (void)toggleChecked;
- (void)scheduleNotification;
- (NSComparisonResult)compare:(ChecklistItem*)otherChecklistItem;
@end
