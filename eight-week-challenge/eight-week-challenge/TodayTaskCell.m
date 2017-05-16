//
//  TodayTaskCell.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "TodayTaskCell.h"

@interface TodayTaskCell ()
@property(weak, nonatomic) IBOutlet UILabel *taskTitle;
@property(weak, nonatomic) IBOutlet UISwitch *taskDoneStatus;
@property(weak, nonatomic) IBOutlet UILabel *pointValue;
@end

@implementation TodayTaskCell

- (void)awakeFromNib {
  [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
}

- (void)configureTask:(Task *)task {
  self.task = task;
  self.taskTitle.text = task.title;
  self.pointValue.text =
      [NSString stringWithFormat:@"Points: %@", task.valueLabel];
}

@end
