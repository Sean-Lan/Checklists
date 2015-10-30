//
//  Checklist.h
//  Checklists
//
//  Created by Xiang on 10/27/15.
//  Copyright © 2015 X-Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject<NSCoding>
@property (nonatomic, copy)NSString *name;
@property (nonatomic, strong)NSMutableArray *items;
@property (nonatomic, copy)NSString *iconName;
- (int)countUncheckedItems;
- (NSComparisonResult)compare:(Checklist*)otherChecklist;
- (void)sortItems;
@end
