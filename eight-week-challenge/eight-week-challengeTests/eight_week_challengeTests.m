//
//  eight_week_challengeTests.m
//  eight-week-challengeTests
//
//  Created by Kyle Hillman on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+StringUtils.h"
#import "StartDate.h"

@interface eight_week_challengeTests : XCTestCase
@end

@implementation eight_week_challengeTests

- (void)setUp {
  [super setUp];
}

- (void)tearDown {
  [super tearDown];
}
  
-(void) testStartDate{
  NSDate *startDate = [NSDate fromString:@"2001-01-01"];
  NSDate *currDate = [NSDate fromString:@"2001-01-05"];
  NSDictionary *result;
  
  result = [StartDate weekNumDayNumFromStartDate:startDate
                                     currentDate:currDate];
    
  XCTAssertEqualObjects(@1, result[@"weekNum"], @"Expected week 1");
  XCTAssertEqualObjects(@5, result[@"dayNum"], @"Expected day 1");
}

@end
