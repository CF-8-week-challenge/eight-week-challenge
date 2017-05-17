//
//  StartDate.m
//  eight-week-challenge
//
//  Created by Pavel Parkhomey on 5/16/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "StartDate.h"

@implementation StartDate

+(NSDictionary*) weekNumDayNumFromStartDate:(NSDate*)startDate
                                currentDate:(NSDate*)currentDate {
  NSTimeInterval seconds;
  NSNumber *weekNum, *dayNum;
  double days, weeks;

  seconds = [currentDate timeIntervalSinceDate:startDate];
  days = seconds / 60 / 60 / 24;
  weeks = days / 7;
  
  dayNum = [NSNumber numberWithInt:((int)days % 7) + 1];
  weekNum = [NSNumber numberWithInt:(int)weeks + 1];

  NSDictionary* result = @{ @"weekNum": weekNum, @"dayNum": dayNum };
  NSLog(@"Days and Week: %@", result);
  
  return result;
}

@end
