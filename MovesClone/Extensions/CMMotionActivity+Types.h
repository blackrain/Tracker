//
//  NSObject+CMMotionActivity_Type.h
//  MovesClone
//
//  Created by Michał Januszewski on 27/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@interface CMMotionActivity (Types)

- (BOOL)sameActivity:(CMMotionActivity*)to;
- (NSString*)name;

@end
