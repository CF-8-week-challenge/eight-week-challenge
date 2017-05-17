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
  NSDate *startDate = [NSDate fromString:@"2001-01-01"];
  NSDate *currDate = [NSDate fromString:@"2001-01-05"];
  NSDictionary *result;
  
  result = [ProgramDay weekNumDayNumFromStartDate:startDate
                                      currentDate:currDate];
    
  XCTAssertEqualObjects(@1, result[@"weekNum"], @"Expected week 1");
  XCTAssertEqualObjects(@5, result[@"dayNum"], @"Expected day 1");
}

@end
