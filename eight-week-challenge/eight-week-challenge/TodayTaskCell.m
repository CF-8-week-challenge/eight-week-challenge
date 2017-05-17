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
  self.resourceURL = @"https://effortmanager-staging.herokuapp.com/api/tasks";
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
  AFHTTPRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
  [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  [serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  self.sessionManager.requestSerializer = serializer;
  
  [self.sessionManager POST:self.resourceURL
                 parameters:nil
                   progress:nil
                    success:^(NSURLSessionTask *task, id responseObject) {
                      NSLog(@"%@", task);
                      NSLog(@"%@", responseObject);
//                        TODO:
//                        self.task.uid = responseObject.uid;
                    }
                    failure:^(NSURLSessionTask *operation, NSError *error) {
                      NSLog(@"Error: %@", error);
                    }];
}

- (void) deleteTaskCompletion {
  NSNumber *taskId = self.task.uid;
  NSString *taskURL = [NSString stringWithFormat:@"%@/%@", self.resourceURL, taskId];
  
  [self.sessionManager DELETE:taskURL
                   parameters:nil
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        NSLog(@"%@", task);
                        NSLog(@"%@", responseObject);
                      }
                      failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        NSLog(@"Error: %@", error);
                      }];
}

@end
