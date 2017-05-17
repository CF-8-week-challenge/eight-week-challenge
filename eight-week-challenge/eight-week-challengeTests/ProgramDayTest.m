//
//  ProgramDayTest.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/17/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

@import XCTest;
#import "ProgramDay.h"
#import "NSDate+StringUtils.h"

@interface ProgramDayTest : XCTestCase
@end

@implementation ProgramDayTest

-(void) testWeekNumDayNumReturnsCorrectValues{
  NSDate *startDate = [NSDate fromString:@"2017-01-01"];
  NSDate *currDate = [NSDate fromString:@"2017-01-05"];
  NSDictionary *result;
  
  result = [ProgramDay weekNumDayNumFromStartDate:startDate
                                      currentDate:currDate];
    
  XCTAssertEqualObjects(@1, result[@"weekNum"], @"Expected week 1");
  XCTAssertEqualObjects(@5, result[@"dayNum"], @"Expected day 1");
}

-(void) testWeekNumDayNumHandlesStartDay {
  NSDate *startDate = [NSDate fromString:@"2017-01-01"];
  NSDate *currDate = [NSDate fromString:@"2017-01-01"];
  NSDictionary *result;
  
  result = [ProgramDay weekNumDayNumFromStartDate:startDate
                                      currentDate:currDate];
    
  XCTAssertEqualObjects(@1, result[@"weekNum"]);
  XCTAssertEqualObjects(@1, result[@"dayNum"]);
}

-(void) testWeekNumDayNumHandlesLastDayOfFirstWeek {
  NSDate *startDate = [NSDate fromString:@"2017-01-01"];
  NSDate *currDate = [NSDate fromString:@"2017-01-07"];
  NSDictionary *result;
  
  result = [ProgramDay weekNumDayNumFromStartDate:startDate
                                      currentDate:currDate];
    
  XCTAssertEqualObjects(@1, result[@"weekNum"]);
  XCTAssertEqualObjects(@7, result[@"dayNum"]);
}

-(void) testWeekNumDayNumHandlesFirstDayOfSecondWeek {
  NSDate *startDate = [NSDate fromString:@"2017-01-01"];
  NSDate *currDate = [NSDate fromString:@"2017-01-08"];
  NSDictionary *result;
  
  result = [ProgramDay weekNumDayNumFromStartDate:startDate
                                      currentDate:currDate];
    
  XCTAssertEqualObjects(@2, result[@"weekNum"]);
  XCTAssertEqualObjects(@1, result[@"dayNum"]);
}


-(void) testWeekNumDayNumHandlesEightWeeksFromStartDate {
  NSDate *startDate = [NSDate fromString:@"2017-01-01"];
  NSDate *currDate = [NSDate fromString:@"2017-02-26"];
  NSDictionary *result;
  
  result = [ProgramDay weekNumDayNumFromStartDate:startDate
                                      currentDate:currDate];
    
  XCTAssertEqualObjects(@9, result[@"weekNum"]);
  XCTAssertEqualObjects(@1, result[@"dayNum"]);
}

@end
