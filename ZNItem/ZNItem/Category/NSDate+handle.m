//
//  NSDate+handle.m
//  ZNItem
//
//  Created by Mr.Z on 2017/12/20.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import "NSDate+handle.h"

@implementation NSDate (handle)
+ (NSDate *)localDate
{
    return [[NSDate date] dateByAddingTimeInterval:[NSTimeZone systemTimeZone].secondsFromGMT];
}

+ (NSTimeInterval)localTime
{
    return [[self localDate] timeIntervalSince1970];
}

- (NSDate *)dateOfStartDate
{
    time_t time = [self timeIntervalSince1970];
    struct tm *t = gmtime(&time);
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [fmt dateFromString:[NSString stringWithFormat:@"%d-%02d-%02d 00:00:00",t->tm_year+1900,t->tm_mon+1,t->tm_mday]];
}

- (NSDate *)dateofNextDate {
    time_t time = [self timeIntervalSince1970];
    struct tm *t = gmtime(&time);
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [fmt dateFromString:[NSString stringWithFormat:@"%d-%02d-%02d 00:00:00",t->tm_year+1900,t->tm_mon+1,t->tm_mday + 1]];
}

- (NSTimeInterval)dateOfStartTime
{
    return [[self dateOfStartDate] timeIntervalSince1970];
}

@end
