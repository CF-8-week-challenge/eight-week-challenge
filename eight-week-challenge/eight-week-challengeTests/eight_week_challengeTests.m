//
//  eight_week_challengeTests.m
//  eight-week-challengeTests
//
//  Created by Kyle Hillman on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StartDate.h"

@interface eight_week_challengeTests : XCTestCase

@property(strong, nonatomic) NSDate *testStartDay;

@end

@implementation eight_week_challengeTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testCurrentWeekAndDayFromStartDate{
    NSDate *testingDate = [[NSDate alloc]init];
    id testDay= [StartDate currentWeekAndDayFromStartDate:testingDate];
    
    XCTAssert([testDay isKindOfClass:[NSDictionary class]], @"Start Day Success!");
}


@end
