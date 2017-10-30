//
//  NSDate+Additions.h
//  MovesClone
//
//  Created by Michał Januszewski on 30/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Additions)

- (NSDate*)beginningOfDay;
- (NSDate*)endOfDay;
- (NSInteger)secondsBetweenDate:(NSDate*)date;

@end
