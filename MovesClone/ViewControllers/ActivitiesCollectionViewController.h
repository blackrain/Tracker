//
//  ActivitiesViewControllerCollectionViewController.h
//  MovesClone
//
//  Created by Michał Januszewski on 26/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ActivitiesCollectionViewController : UICollectionViewController
    <UICollectionViewDelegateFlowLayout, CLLocationManagerDelegate>

@end
