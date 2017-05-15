//
//  Task.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "Task.h"

@implementation Task
+ (instancetype) taskFromDict:(NSDictionary*)dict {
  Task *task = [[Task alloc] init];
  task.title = dict[@"title"];
  task.value = dict[@"value"];
  return task;
}
@end