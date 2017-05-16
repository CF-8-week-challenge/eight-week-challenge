//
//  startDate.h
//  eight-week-challenge
//
//  Created by Pavel Parkhomey on 5/16/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface startDate : NSObject

+(NSDictionary*) currrentWeekAndDayFromStartDate:(NSDate*)startDate todaysDate:(NSDate*)todaysDate;

@end
