//
//  Task.h
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

@import Foundation;

@interface Task : NSObject
@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *valueLabel;
@property(strong, nonatomic) NSDictionary *value;
@property(nonatomic) BOOL allowsValueOptions;

+ (instancetype)taskFromDict:(NSDictionary *)dict;
+ (NSArray *)tasksFromDicts:(NSArray *)dicts;
@end
