//
//  LocationAndActivityTracker.m
//  MovesClone
//
//  Created by Michał Januszewski on 30/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import "LocationAndActivityTracker.h"
#import "NSDate+Additions.h"
#import "CMMotionActivity+Types.h"
#import "Activity.h"

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

@interface LocationAndActivityTracker ()

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CMMotionActivityManager *activityManager;

@property (nonatomic, strong) NSMutableArray<CLVisit*> *visits;

@end

@implementation LocationAndActivityTracker

+ (LocationAndActivityTracker *)sharedInstance {
    static LocationAndActivityTracker *sharedInstance = nil;

    if (sharedInstance == nil) {
        sharedInstance = [LocationAndActivityTracker new];
    }

    return sharedInstance;
}

- (instancetype)init {
    self = [super init];

    if (self) {
        [self setupManagers];
    }

    return self;
}

- (void)setupManagers {
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    self.locationManager.allowsBackgroundLocationUpdates = YES;

    self.activityManager = [CMMotionActivityManager new];
}

- (void)startUpdatingLocation {
    [self.locationManager startMonitoringVisits];
}

- (void)stopUpdatingLocation {
    [self.locationManager stopMonitoringVisits];
}

- (void)startBackgroundLocation {
    
}

- (void)stopBackgroundLocation {

}

- (void)activityItemsForDate:(NSDate *)date onComplete:(void (^)(NSArray<Activity *>*))completion {
    NSDate *beginningDate = [date beginningOfDay];
    NSDate *endDate = [date endOfDay];

    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:YES];

    [self.activityManager queryActivityStartingFromDate:beginningDate
                                                 toDate:endDate
                                                toQueue:[NSOperationQueue currentQueue]
                                            withHandler:^(NSArray<CMMotionActivity *> * _Nullable activities,
                                                          NSError * _Nullable error) {
                                                NSArray<CMMotionActivity*> *processedItems = [[self filteredActivities:activities] sortedArrayUsingDescriptors:@[sortDescriptor]];
                                                completion([self activitiesFrom:processedItems]);
                                            }];
}

- (NSArray<CMMotionActivity*> *)filteredActivities:(NSArray<CMMotionActivity*> *)source {
    NSMutableArray<CMMotionActivity*> *buffer = [NSMutableArray new];

    for (CMMotionActivity *activity in source) {
        //  *    Or the device could be in motion but not walking or in a vehicle.
        // *     stationary = NO, walking = NO, running = NO, automotive = NO.
        if (activity.stationary || activity.walking || activity.running || activity.automotive) {
            if ([buffer count] == 0) {
                [buffer addObject:activity];
            } else {
                CMMotionActivity *lastItem = [buffer lastObject];

                if (![lastItem sameActivity:activity]) {
                    [buffer addObject:activity];
                }
            }
        }
    }
    return (NSArray*) buffer;
}

- (NSArray<Activity*>*)activitiesFrom:(NSArray<CMMotionActivity*>*)motionActivities {
    NSMutableArray<Activity*> *buffer = [NSMutableArray new];

    for (NSUInteger i=0; i<motionActivities.count; i++) {
        NSInteger seconds = 0;

        CMMotionActivity *item = motionActivities[i];

        if (i < motionActivities.count - 1) {
            CMMotionActivity *item2 = motionActivities[i+1];
            seconds = [item.startDate secondsBetweenDate:item2.startDate];
        } else {
            seconds = [item.startDate secondsBetweenDate:[NSDate new]];
        }

        Activity *activity = [Activity new];

        activity.isInsideBuilding = [self activityInsideBuilding:item];
        activity.name = item.name;
        activity.duration = seconds;

        if (item.stationary) {
            activity.type = Stationary;
        } else if (item.walking) {
            activity.type = Walking;
        } else if (item.running) {
            activity.type = Running;
        } else if (item.automotive) {
            activity.type = Automotive;
        }

        [buffer addObject:activity];
    }

    return (NSArray<Activity*>*) buffer;
}

- (BOOL)activityInsideBuilding:(CMMotionActivity*)activity {
    for (CLVisit *visit in self.visits) {
        if ([activity.startDate compare:visit.arrivalDate] == NSOrderedDescending && [activity.startDate compare:visit.departureDate] == NSOrderedAscending) {
            return YES;
        }
    }
    return NO;
}

#pragma mark <CLLocationManagerDelegate>

- (void)locationManager:(CLLocationManager *)manager didVisit:(CLVisit *)visit {
    [self.visits addObject:visit];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    ALog(@"%@", error);
}

@end
