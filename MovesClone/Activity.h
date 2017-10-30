//
//  Activity.h
//  MovesClone
//
//  Created by Michał Januszewski on 29/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>

typedef NS_ENUM(NSInteger, ActivityType) {
    Stationary,
    Walking,
    Running,
    Automotive
};

@interface Activity : NSObject

@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, assign) double duration;
@property (nonatomic, assign) BOOL isInsideBuilding;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) CLLocationCoordinate2D location;
@property (nonatomic, assign) ActivityType type;

@end
