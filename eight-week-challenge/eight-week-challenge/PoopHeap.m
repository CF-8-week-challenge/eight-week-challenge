//
//  PoopHeap.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/18/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "PoopHeap.h"
#import "Task.h"
@import UIKit;

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
  NSString *userEmail = [self currentUserEmail];
  self.users[userEmail] = userDict;
}

- (void) addGroup:(NSDictionary*)groupDict {
  NSString *groupName = groupDict[@"name"];
  self.groups[groupName] = groupDict;
}

- (void) addJournalEntry:(Task*)task {
  NSString *userEmail = self.currentUserEmail;

  if (!self.journalEntries[userEmail]) {
    self.journalEntries[userEmail] = [NSMutableArray array];
    [self.journalEntries[userEmail] addObject:task];
  } else {
    NSMutableArray *entries = [NSMutableArray arrayWithArray:self.journalEntries[userEmail]];
    [entries addObject:task];
    self.journalEntries[userEmail] = entries;
  }
}

- (void) removeJournalEntry:(Task*)task {
  NSString *userEmail = self.currentUserEmail;
  NSMutableArray *entries = [NSMutableArray arrayWithArray:self.journalEntries[userEmail]];
  [entries removeObject:task];
  self.journalEntries[userEmail] = entries;
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

- (NSArray*) getCurrentUserGroupMembers {
  NSDictionary *currUser = [self getUserByEmail:[self currentUserEmail]];
  NSString *groupName = currUser[@"groupName"];
  NSMutableArray *teammates = [NSMutableArray array];
  
  for (NSString *userEmail in self.users) {
    NSDictionary *user = self.users[userEmail];

    if ([user[@"groupName"] isEqualToString:groupName]) {
      [teammates addObject:user];
    }
  }

  return teammates;
}

- (NSArray*) getLeaderBoard {
  if (self.journalEntries.count == 0) { return [self sampleEntries]; }
  NSMutableArray *board = [NSMutableArray array];
  NSArray *members = [self getCurrentUserGroupMembers];

  for (NSDictionary *member in members) {
    NSArray *tasks = [self getJournalEntriesByUserEmail:member[@"email"]];

    int sum = 0;
    for (Task *task in tasks) {
      sum += [task.value intValue];
    }

    [board addObject:@{@"name":[PoopHeap.shared currentUserName],
                       @"image":[PoopHeap.shared currentUserImage],
                       @"score":[NSNumber numberWithInt:sum]}];
  }

  [board addObjectsFromArray:[self sampleEntries]];
  
  NSSortDescriptor *sortByScore = [NSSortDescriptor sortDescriptorWithKey:@"score" ascending:NO];
  NSArray *sortDescriptors = [NSArray arrayWithObject:sortByScore];
  NSArray *sortedArray = [board sortedArrayUsingDescriptors:sortDescriptors];

  return sortedArray;
}

- (NSArray*) sampleEntries {
  return @[
    @{@"name":@"Ulya Markova", @"score":@30, @"image": [UIImage imageNamed:@"face-f1"] },
    @{@"name":@"Viktor Vashchuk", @"score":@25, @"image": [UIImage imageNamed:@"face-m"] },
    @{@"name":@"Marina Parkhomey", @"score":@20, @"image": [UIImage imageNamed:@"face-f2"] }
  ];
}

@end
