//
//  PoopHeap.h
//  eight-week-challenge
//
//  Created by Jake Romer on 5/18/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

@import Foundation;
#import "Task.h"

@interface PoopHeap : NSObject
@property (strong, nonatomic) NSString *currentUserEmail;
@property (strong, nonatomic) NSString *currentUserName;

+ (instancetype) shared;

- (void) addUser:(NSDictionary*)userDict;
- (void) addGroup:(NSDictionary*)groupDict;
- (void) addJournalEntry:(Task*)task;

- (void) removeJournalEntry:(Task*)task;

- (NSDictionary*) getUserByEmail:(NSString*)email;
- (NSDictionary*) getGroupByName:(NSString*)name;
- (NSArray*) getJournalEntriesByUserEmail:(NSString*)email;
- (NSArray*) getLeaderBoard;
@end
