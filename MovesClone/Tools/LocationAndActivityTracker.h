//
//  LocationAndActivityTracker.h
//  MovesClone
//
//  Created by Michał Januszewski on 30/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#import <CoreLocation/CoreLocation.h>
#import "Activity.h"

@interface LocationAndActivityTracker : NSObject<CLLocationManagerDelegate>

+ (LocationAndActivityTracker*)sharedInstance;

- (void)startUpdatingLocation;
- (void)stopUpdatingLocation;

- (void)activityItemsForDate:(NSDate*)date onComplete:(void (^)(NSArray<Activity *>*))completion;

@end
