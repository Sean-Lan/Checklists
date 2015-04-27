//
//  Checklist.m
//  Checklists
//
//  Created by Xiang on 15/4/21.
//  Copyright (c) 2015年 X-Company. All rights reserved.
//

#import "Checklist.h"

@implementation Checklist
- (id)init {
    if ((self = [super init])) {
        self.items = [[NSMutableArray alloc] initWithCapacity:20];
    }
    return self;
}

@end
