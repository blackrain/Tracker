//
//  AppDelegate.m
//  MovesClone
//
//  Created by Michał Januszewski on 26/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import "AppDelegate.h"
#import "LocationAndActivityTracker.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[LocationAndActivityTracker sharedInstance] startUpdatingLocation];

    return YES;
}

@end
