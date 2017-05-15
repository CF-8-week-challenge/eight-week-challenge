//
//  LeaderboardItem.h
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeaderboardItem : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *currentScore;

+ (instancetype) itemFromDict:(NSDictionary*)dict;
@end