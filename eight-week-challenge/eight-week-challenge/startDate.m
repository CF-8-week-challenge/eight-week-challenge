//
//  StartDate.m
//  eight-week-challenge
//
//  Created by Pavel Parkhomey on 5/16/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "StartDate.h"
#import <tgmath.h>

@implementation StartDate

+(NSDictionary*) currentWeekAndDayFromStartDate:(NSDate*)startDate{
    
    
    NSTimeInterval interval = [startDate timeIntervalSinceNow];
    double rawWeeks = ((interval / 604800) * -1);
    int week = (int)rawWeeks;
    double rawDays = rawWeeks - (double)week;
    int day = (int)(rawDays * 10);
    NSString *weekConverted = [NSString stringWithFormat:@"%d",week];
    NSString *dayConverted = [NSString stringWithFormat:@"%d",day];
    NSDictionary* dayInWeek = @{ @"weekNum": weekConverted, @"dayNum": dayConverted };
    NSLog(@"Days and Week: %@", dayInWeek);
    
    return dayInWeek;
}

+(NSDate *)formatDate:(NSString *)date {
      NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setLocale:locale];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter dateFromString:date];
}
@end
