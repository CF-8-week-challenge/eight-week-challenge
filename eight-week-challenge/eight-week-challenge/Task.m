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

  if ([dict[@"value"] isKindOfClass:[NSDictionary class]]) {
    NSMutableArray *options = [NSMutableArray array];

    for (NSString *key in dict[@"value"]) {
      [options addObject:[NSString stringWithFormat:@"%@ (%@)",
                                                    dict[@"value"][key], key]];
    }

    task.valueLabel = [options componentsJoinedByString:@" / "];
    task.value = dict[@"value"];
    task.allowsValueOptions = YES;
  } else {
    task.valueLabel = dict[@"value"];
    task.value = @{ @"value" : dict[@"value"] };
    task.allowsValueOptions = NO;
  }

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
