//
//  EffortManagerAPI.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/17/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "EffortManagerAPI.h"
@import AFNetworking;

@interface EffortManagerAPI ()
@property (strong, nonatomic) AFHTTPSessionManager *manager;
@end

@implementation EffortManagerAPI

+ (instancetype) shared {
  static EffortManagerAPI *shared = nil;
  static dispatch_once_t onceToken;

  dispatch_once(&onceToken, ^{
    shared = [[EffortManagerAPI alloc] init];
  });

  return shared;
}

- (instancetype)init {
  self = [super init];
  self.manager = [AFHTTPSessionManager manager];
  return self;
}

- (void) postGroupWithParams:(NSDictionary *)params {
//  NSString *postUrl = @"https://effortmanager-staging.herokuapp.com/api/group";
  NSString *postUrl = @"http://127.0.0.1:3000/api/group";
  NSString *authStr = @"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjVlZmI3Y2ZmMzg4ZTA2NTRmNjc1ZGZkNWUzNTA1YmEzNmQ1ODc2NTUzOTAzNGU5NmNhZDhjZWYyNDRkMzMyMGEiLCJpYXQiOjE0OTUwNTUwNDd9.bDc5vjUaRtNxErUIz5y_XdWE8bT-iK50HVX-6D88V7g";

  AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
  [serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  [serializer setValue:authStr forHTTPHeaderField:@"Authentication"];
  
  self.manager.requestSerializer = serializer;

  [self.manager POST:postUrl
     parameters:params
       progress:nil
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          NSLog(@"Persisted group: %@", responseObject);
        }
        failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        }];
}
@end
