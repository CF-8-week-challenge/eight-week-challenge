//
//  Task.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "Task.h"
#import "TaskCatalog.h"
#import "NSDate+StringUtils.h"
#import "ProgramDay.h"

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

+ (NSArray *)tasksForToday {
  NSDate *start, *today;
  NSDictionary *dict;
  NSArray *taskAttrs;

  // TODO: Store this someplace
  start = [NSDate fromString:@"2017-05-01"];
  today = [[NSDate alloc] init];
  dict = [ProgramDay weekNumDayNumFromStartDate:start currentDate:today];

  taskAttrs = [TaskCatalog.shared tasksForWeekNum:dict[@"weekNum"]
                                           dayNum:dict[@"dayNum"]];
  return [self tasksFromDicts:taskAttrs];
}
@end
