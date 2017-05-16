//
//  TodayTaskCell.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "TodayTaskCell.h"
@import AFNetworking;

@interface TodayTaskCell ()
@property(weak, nonatomic) IBOutlet UILabel *taskTitle;
@property(weak, nonatomic) IBOutlet UISwitch *taskDoneStatus;
@property(weak, nonatomic) IBOutlet UILabel *pointValue;
@property(strong, nonatomic) NSString *resourceURL;
@property(strong, nonatomic) AFHTTPSessionManager *sessionManager;
@end

@implementation TodayTaskCell

- (void)awakeFromNib {
  [super awakeFromNib];
  self.resourceURL = @"https://demo2029138.mockable.io/tasks";
  self.sessionManager = [AFHTTPSessionManager manager];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
}

- (void)configureTask:(Task *)task {
  self.task = task;
  self.taskTitle.text = task.title;
  self.pointValue.text =
      [NSString stringWithFormat:@"Points: %@", task.value];
}

- (IBAction)switchWasToggled:(UISwitch *)sender {
  if (sender.on) {
    [self postTaskCompletion];
  } else {
    [self deleteTaskCompletion];
  }
}

- (void) postTaskCompletion {
  [self.sessionManager POST:self.resourceURL
                 parameters:nil
                   progress:nil
                    success:^(NSURLSessionTask *task, id responseObject) {
                      // do shit
                    }
                    failure:^(NSURLSessionTask *operation, NSError *error) {
                      NSLog(@"Error: %@", error);
                    }];
}

- (void) deleteTaskCompletion {
  [self.sessionManager DELETE:self.resourceURL
                   parameters:nil
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        // do shit
                      }
                      failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        NSLog(@"Error: %@", error);
                      }];
}

@end
