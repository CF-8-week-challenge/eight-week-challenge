//
//  TaskCatalog.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/17/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "TaskCatalog.h"

@interface TaskCatalog ()
@property (strong, nonatomic) NSDictionary *tasks;
@end

@implementation TaskCatalog

+ (instancetype) shared {
  static TaskCatalog *shared = nil;
  static dispatch_once_t onceToken;

  dispatch_once(&onceToken, ^{
    shared = [[TaskCatalog alloc] init];
  });

  return shared;
}

- (instancetype)init {
  self = [super init];
  
  NSString *path = [[NSBundle mainBundle] pathForResource:@"tasks"
                                                   ofType:@"json"];
  NSData *jsonData = [NSData dataWithContentsOfFile:path];
  NSError *jsonError;
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                       options:NSJSONReadingMutableContainers
                                                         error:&jsonError];
  if (jsonError) {
    NSLog(@"JSON Parsing error: %@", jsonError);
  } else {
    self.tasks = dict;
  }
  
  return self;
}

- (NSArray *)tasksForWeekNum:(NSNumber *)week dayNum:(NSNumber *)day {
  NSString *weekString = [NSString stringWithFormat:@"week%@", week];
  NSString *dayString = [NSString stringWithFormat:@"day%@", day];
  return self.tasks[weekString][dayString];
}
@end
