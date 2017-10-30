//
//  DateFormatter.h
//  MovesClone
//
//  Created by Michał Januszewski on 30/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateFormatter : NSObject

@property (nonatomic, strong) NSDateFormatter *hourFormatter;

+ (DateFormatter*)sharedInstance;

@end
