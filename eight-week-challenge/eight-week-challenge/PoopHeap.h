//
//  PoopHeap.h
//  eight-week-challenge
//
//  Created by Jake Romer on 5/18/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

@import Foundation;

@interface PoopHeap : NSObject
+ (instancetype) shared;

- (void) addUser:(NSDictionary*)userDict;
- (void) addGroup:(NSDictionary*)groupDict;
- (void) addJournalEntry:(NSDictionary*)entryDict;

- (NSDictionary*) getUserByEmail:(NSString*)email;
- (NSDictionary*) getGroupByName:(NSString*)name;
- (NSArray*) getJournalEntriesByUserEmail:(NSString*)email;
@end
