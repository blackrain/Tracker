//
//  NSObject+CMMotionActivity_Type.m
//  MovesClone
//
//  Created by Michał Januszewski on 27/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import "CMMotionActivity+Types.h"

@implementation CMMotionActivity (Types)

- (BOOL)sameActivity:(CMMotionActivity*)other {
    if (self.automotive && self.automotive == other.automotive) { return YES; }
    if (self.walking && self.walking == other.walking) { return YES; }
    if (self.running && self.running == other.running) { return YES; }
    if (self.stationary && self.stationary == other.stationary) { return YES; }
    
    return NO;
}

- (NSString *)name {
    if (self.automotive) { return @"Auto"; }
    else if (self.walking) { return @"Walking"; }
    else if (self.running) { return @"Running"; }
    else if (self.stationary) { return @"Stationary"; }
    else return @"Not defined";
}

@end
