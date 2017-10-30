//
//  NSDate+Additions.m
//  MovesClone
//
//  Created by Michał Januszewski on 30/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import "NSDate+Additions.h"

@implementation NSDate (Additions)

- (NSDate *)beginningOfDay {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:self];

    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];

    NSTimeInterval timeZoneSeconds = [[NSTimeZone localTimeZone] secondsFromGMT];
    return [[cal dateFromComponents:components] dateByAddingTimeInterval:timeZoneSeconds];
}

- (NSDate *)endOfDay {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:self];

    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];

    NSTimeInterval timeZoneSeconds = [[NSTimeZone localTimeZone] secondsFromGMT];
    return [[cal dateFromComponents:components] dateByAddingTimeInterval:timeZoneSeconds];
}

- (NSInteger)secondsBetweenDate:(NSDate*)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitSecond
                                               fromDate:self
                                                 toDate:date
                                                options:0];
    return components.second;
}

@end
