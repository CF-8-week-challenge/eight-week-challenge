//
//  NSDate+StringUtils.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/17/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "NSDate+StringUtils.h"

@implementation NSDate (StringUtils)

+(NSDate *) fromString:(NSString *)dateString {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
  [formatter setLocale:locale];
  [formatter setDateFormat:@"yyyy-MM-dd"];
  return [formatter dateFromString: dateString];
}

@end
