//
//  LeaderboardCell.h
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

@import UIKit;
#import "LeaderboardItem.h"

@interface LeaderboardCell : UICollectionViewCell
@property (strong, nonatomic) LeaderboardItem *item;
  
- (void) configureItem:(LeaderboardItem*)item;
@end
