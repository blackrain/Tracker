//
//  ActivityCell.m
//  MovesClone
//
//  Created by Michał Januszewski on 26/10/2017.
//  Copyright © 2017 GearAppa. All rights reserved.
//

#import "ActivityCell.h"

@implementation ActivityCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self setClipsToBounds:YES];
}

- (void)setupWith:(Activity *)activity {
    self.itemTitle.text = [NSString stringWithFormat:@"%@: %d minutes", activity.name, (int) (activity.duration / 60.0)];

    
}

@end
