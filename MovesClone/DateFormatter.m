//
//  DateFormatter.m
//  MovesClone
//
//  Created by Michał Januszewski on 30/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import "DateFormatter.h"

@implementation DateFormatter

+ (DateFormatter *)sharedInstance {
    static DateFormatter *sharedInstance = nil;

    if (sharedInstance == nil) {
        sharedInstance = [DateFormatter new];
        [sharedInstance setupFormatters];
    }

    return sharedInstance;
}

- (void)setupFormatters {
    self.hourFormatter = [NSDateFormatter new];
    self.hourFormatter.dateFormat = @"HH:mm";
}

@end
