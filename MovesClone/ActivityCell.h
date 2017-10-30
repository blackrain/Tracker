//
//  ActivityCell.h
//  MovesClone
//
//  Created by Michał Januszewski on 26/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"

@interface ActivityCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UILabel *itemTitle;
@property (nonatomic, weak) IBOutlet UIView *barView;

- (void)setupWith:(Activity*)activity;

@end
