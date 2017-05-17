//
//  TaskCatalog.h
//  eight-week-challenge
//
//  Created by Jake Romer on 5/17/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

@import Foundation;

@interface TaskCatalog : NSObject
+ (instancetype) shared;
- (NSArray *) tasksForWeekNum:(NSNumber*)week dayNum:(NSNumber*)day;
@end
