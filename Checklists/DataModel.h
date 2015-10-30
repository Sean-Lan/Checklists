//
//  DataModel.h
//  Checklists
//
//  Created by Xiang on 10/28/15.
//  Copyright © 2015 X-Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property(nonatomic, strong) NSMutableArray *lists;
- (void)saveChecklists;
- (NSInteger)indexOfSelectedChecklist;
- (void)setIndexOfSelectedChecklist:(NSInteger)index;
- (void)sortChecklists;
+ (NSInteger)nextChecklistItemId;
@end
