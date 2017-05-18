//
//  PoopHeap.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/18/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "PoopHeap.h"

@interface PoopHeap ()
@property (strong, nonatomic) NSMutableDictionary *groups;
@property (strong, nonatomic) NSMutableDictionary *users;
@property (strong, nonatomic) NSMutableDictionary *journalEntries;
@end

@implementation PoopHeap

+ (instancetype) shared {
  static dispatch_once_t onceToken;
  static PoopHeap *shared = nil;
  
  dispatch_once(&onceToken, ^{
    shared = [[PoopHeap alloc] init];
  });
  
  return shared;
}

- (instancetype) init {
  self = [super init];
  if (self) {
    self.groups = [NSMutableDictionary dictionary];
    self.users = [NSMutableDictionary dictionary];
    self.journalEntries = [NSMutableDictionary dictionary];
  }
  return self;
}

- (void) addUser:(NSDictionary*)userDict {
  NSString *userEmail = userDict[@"email"];
  self.users[userEmail] = userDict;
}

- (void) addGroup:(NSDictionary*)groupDict {
  NSString *groupName = groupDict[@"name"];
  self.groups[groupName] = groupDict;
}

- (void) addJournalEntry:(NSDictionary*)entryDict {
  NSString *userEmail = entryDict[@"userEmail"];

  if (!self.groups[userEmail]) {
    self.groups[userEmail] = [NSMutableArray array];
  }

  NSMutableArray *userEntries = self.groups[userEmail];
  [userEntries addObject:entryDict];
  self.groups[userEmail] = userEntries;
}

- (NSDictionary*) getUserByEmail:(NSString*)email {
  return self.users[email];
}

- (NSDictionary*) getGroupByName:(NSString*)name {
  return self.groups[name];
}

- (NSArray*) getJournalEntriesByUserEmail:(NSString*)email {
  return self.journalEntries[email];
}

@end
