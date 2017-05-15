//
//  LeaderboardCell.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "LeaderboardCell.h"

@interface LeaderboardCell ()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@end

@implementation LeaderboardCell

- (void) configureItem:(LeaderboardItem *)item {
  self.item = item;
  self.userName.text = item.name;
}

@end
