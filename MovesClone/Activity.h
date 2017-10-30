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

@interface Activity : NSObject

@property (nonatomic, assign) double duration;
@property (nonatomic, assign) BOOL isInsideBuilding;
@property (nonatomic, strong) NSString *name;

@end
