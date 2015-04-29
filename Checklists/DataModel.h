//
//  DataModel.h
//  Checklists
//
//  Created by Xiang on 15/4/29.
//  Copyright (c) 2015年 X-Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong) NSMutableArray *lists;

- (void)saveChecklists;

@end
