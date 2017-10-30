//
//  ActivityHeader.m
//  MovesClone
//
//  Created by Michał Januszewski on 30/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import "ActivityHeader.h"
#import "NSDate+Additions.h"

#import <CoreMotion/CoreMotion.h>
#import <QuartzCore/QuartzCore.h>

@interface ActivityHeader ()

@property (nonatomic, weak) IBOutlet UILabel *titleView;
@property (nonatomic, weak) IBOutlet UILabel *activityNameView;
@property (nonatomic, weak) IBOutlet UIView *circleView;
@property (nonatomic, weak) IBOutlet UILabel *stepsCountView;
@property (nonatomic, weak) IBOutlet UILabel *stepsTitleView;
@property (nonatomic, strong) CMPedometer *pedometer;

@end

@implementation ActivityHeader

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];

    [self setupView];
    [self setupData];
}

- (void)setupView {
    _circleView.layer.cornerRadius = CGRectGetWidth(_circleView.bounds) / 2.0;
    _circleView.layer.masksToBounds = YES;
}

- (void)setupData {
    self.pedometer = [CMPedometer new];
    NSDate *startDate = [[NSDate date] beginningOfDay];
    NSDate *endDate = [[NSDate date] endOfDay];

    [_pedometer queryPedometerDataFromDate:startDate toDate:endDate withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.stepsCountView.text = [NSString stringWithFormat:@"%d", pedometerData.numberOfSteps.intValue];
        });
    }];
}

@end
