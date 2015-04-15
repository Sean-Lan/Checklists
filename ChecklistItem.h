//
//  ChecklistItem.h
//  Checklists
//
//  Created by Xiang on 15/4/11.
//  Copyright (c) 2015年 X-Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChecklistItem : NSObject<NSCoding>
@property(nonatomic, copy)NSString *text;
@property(nonatomic, assign)BOOL checked;
-(void) toggleChecked;
@end
