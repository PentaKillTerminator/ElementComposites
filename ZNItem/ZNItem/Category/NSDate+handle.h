//
//  NSDate+handle.h
//  ZNItem
//
//  Created by Mr.Z on 2017/12/20.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (handle)
/**本地UTC时间*/
+ (NSDate *)localDate;

/**本地UTC时间戳*/
+ (NSTimeInterval)localTime;

/**开始时间*/
- (NSDate *)dateOfStartDate;

/**下一天*/
- (NSDate *)dateofNextDate;

/**开始时间戳*/
- (NSTimeInterval)dateOfStartTime;
@end
