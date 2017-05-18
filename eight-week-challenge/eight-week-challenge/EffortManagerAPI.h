//
//  EffortManagerAPI.h
//  eight-week-challenge
//
//  Created by Jake Romer on 5/17/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

@import Foundation;

@interface EffortManagerAPI : NSObject
+ (instancetype) shared;
- (void) postGroupWithParams:(NSDictionary*)params;
@end
