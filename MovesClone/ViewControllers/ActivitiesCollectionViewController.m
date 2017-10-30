//
//  ActivitiesViewControllerCollectionViewController.m
//  MovesClone
//
//  Created by Michał Januszewski on 26/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import "ActivitiesCollectionViewController.h"
#import "ActivityCell.h"
#import "LocationAndActivityTracker.h"
#import "ActivityHeader.h"

@interface ActivitiesCollectionViewController ()

@property (nonatomic, strong) NSArray<Activity*> *activityItems;

@end

@implementation ActivitiesCollectionViewController

static NSString * const reuseIdentifier = @"ActivityCell";

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self updateData];
}

- (void)updateData {
    NSTimeInterval timeZoneSeconds = [[NSTimeZone localTimeZone] secondsFromGMT];
    NSDate *dateInUTC = [[NSDate date] dateByAddingTimeInterval:timeZoneSeconds];

    [[LocationAndActivityTracker sharedInstance] activityItemsForDate:dateInUTC
                                                           onComplete:^(NSArray<Activity *> *activityItems) {
                                                               self.activityItems = activityItems;
                                                               [self.collectionView reloadData];
                                                           }];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.activityItems count];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    if (kind == UICollectionElementKindSectionHeader) {
        ActivityHeader *header = (ActivityHeader*) [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                      withReuseIdentifier:@"ActivityHeader"
                                                                                             forIndexPath:indexPath];
        return header;
    }

    return nil;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ActivityCell *cell = (ActivityCell*) [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                                                   forIndexPath:indexPath];
    
    Activity *activity = self.activityItems[indexPath.row];

    [cell setupWith:activity];

    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    Activity *item = self.activityItems[indexPath.row];
    return CGSizeMake(CGRectGetWidth(self.view.bounds), item.duration);
}

@end
