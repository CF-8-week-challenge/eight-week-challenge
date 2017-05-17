//
//  Task.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "Task.h"

@implementation Task
+ (instancetype)taskFromDict:(NSDictionary *)dict {
  Task *task = [[Task alloc] init];
  task.title = dict[@"title"];
  task.value = dict[@"value"];
  return task;
}

+ (NSArray *)tasksFromDicts:(NSArray *)dicts {
  NSMutableArray *tasks = [[NSMutableArray alloc] init];

  for (NSDictionary *dict in dicts) {
    [tasks addObject:[Task taskFromDict:dict]];
  }

  return tasks;
}
@end
