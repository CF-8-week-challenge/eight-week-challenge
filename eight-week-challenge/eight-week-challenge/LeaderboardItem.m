//
//  LeaderboardItem.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "LeaderboardItem.h"

@implementation LeaderboardItem
  
+ (instancetype) itemFromDict:(NSDictionary *)dict {
  LeaderboardItem *item = [[LeaderboardItem alloc] init];
  item.name = dict[@"name"];
  item.currentScore = dict[@"currentScore"];
  return item;
}
  
@end
