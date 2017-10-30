//
//  ActivityCell.m
//  MovesClone
//
//  Created by Michał Januszewski on 26/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import "ActivityCell.h"

#import <CoreLocation/CoreLocation.h>

@implementation ActivityCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self setClipsToBounds:YES];
}

- (void)setupWith:(Activity *)activity {
    self.itemTitle.text = [NSString stringWithFormat:@"%@: %d minutes", activity.name, (int) (activity.duration / 60.0)];

    switch (activity.type) {
        case Stationary:
            self.barView.backgroundColor = UIColor.yellowColor;
            break;
        case Walking:
            self.barView.backgroundColor = UIColor.greenColor;
            break;
        case Automotive:
            self.barView.backgroundColor = UIColor.grayColor;
            break;
        case Running:
            self.barView.backgroundColor = UIColor.blueColor;
            break;

        default:
            break;
    }

    CLGeocoder *geoCoder = [CLGeocoder new];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:activity.location.latitude longitude:activity.location.longitude];
    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        self.itemTitle.text = [NSString stringWithFormat:@"[%@] %@: %d minutes", placemarks.firstObject.name, activity.name, (int) (activity.duration / 60.0)];
    }];
}

@end
