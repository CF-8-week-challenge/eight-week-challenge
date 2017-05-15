//
//  TodayTaskCell.h
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

@import UIKit;
#import "Task.h"

@interface TodayTaskCell : UITableViewCell
@property (strong, nonatomic) Task *task;
- (void) configureTask:(Task *)task;
@end
