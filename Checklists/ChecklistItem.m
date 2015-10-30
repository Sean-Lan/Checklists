//
//  ChecklistItem.m
//  Checklists
//
//  Created by Xiang on 10/27/15.
//  Copyright © 2015 X-Company. All rights reserved.
//

#import "ChecklistItem.h"
#import "DataModel.h"
#import <UIKit/UIKit.h>

@implementation ChecklistItem

- (id)init{
    if((self =[super init])){
        self.itemId = [DataModel nextChecklistItemId];
    }
    return self;
}

- (void)toggleChecked {
    self.checked = !self.checked;
}

# pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.text forKey:@"Text"];
    [aCoder encodeBool:self.checked forKey:@"Checked"];
    [aCoder encodeObject:self.dueDate forKey:@"DueDate"];
    [aCoder encodeBool:self forKey:@"ShouldRemind"];
    [aCoder encodeInteger:self.itemId forKey:@"ItemID"];
    
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self=[super init])) {
        self.text = [aDecoder decodeObjectForKey:@"Text"];
        self.checked = [aDecoder decodeObjectForKey:@"Checked"];
        self.dueDate = [aDecoder decodeObjectForKey:@"DueDate"];
        self.shouldRemind = [aDecoder decodeBoolForKey:@"ShouldRemind"];
        self.itemId = [aDecoder decodeIntegerForKey:@"ItemID"];
    }
    return self;
}

- (void)scheduleNotification{
    UILocalNotification *existingNotification = [self notificationForThisItem];
    
    if (existingNotification != nil) {
        [[UIApplication sharedApplication] cancelLocalNotification:existingNotification];
    }
    
    if (self.shouldRemind &&
       [self.dueDate compare:[NSDate date]] != NSOrderedAscending) {
        UILocalNotification *localNotification = [[UILocalNotification alloc]init];
        localNotification.fireDate = self.dueDate;
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.alertBody = self.text;
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification.userInfo = @{@"ItemID" : @(self.itemId)};
        [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
    }
}

- (UILocalNotification *)notificationForThisItem {
    NSArray *allNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    for (UILocalNotification *notification in allNotifications) {
        NSNumber *number = [notification.userInfo objectForKey:@"ItemID"];
        if (number != nil && [number integerValue] == self.itemId) {
            return notification;
        }
    }
    return nil;
}

- (NSComparisonResult)compare:(ChecklistItem*)otherChecklistItem {
    return [self.dueDate compare:otherChecklistItem.dueDate];
}

- (void)dealloc {
    UILocalNotification *existingNotification = [self notificationForThisItem];
    if (existingNotification != nil) {
        [[UIApplication sharedApplication] cancelLocalNotification:existingNotification];
    }
}
@end
