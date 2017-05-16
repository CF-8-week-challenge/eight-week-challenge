//
//  TodayViewController.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "TodayViewController.h"
#import "TodayTaskCell.h"
#import "Task.h"

@interface TodayViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *todaysTasks;
@end

@implementation TodayViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.dataSource = self;
  self.tableView.delegate = self;

  UINib *todayTaskCell = [UINib nibWithNibName:@"TodayTaskCell" bundle:nil];
  [self.tableView registerNib:todayTaskCell forCellReuseIdentifier:@"TodayTaskCell"];

  NSArray *today;
  NSString *path = [[NSBundle mainBundle] pathForResource:@"tasks" ofType:@"json"];
  NSData *jsonData = [NSData dataWithContentsOfFile:path];
  NSError *jsonError;
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                       options:NSJSONReadingMutableContainers
                                                         error:&jsonError];
  if (jsonError) {
    NSLog(@"JSON Parsing error: %@", jsonError);
  } else {
    today = dict[@"week3"][@"day6"];
    self.todaysTasks = [Task tasksFromDicts:today];
  }
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return self.todaysTasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  TodayTaskCell *cell;
  Task *selectedTask;
  
  cell = (TodayTaskCell *)
  [tableView dequeueReusableCellWithIdentifier:@"TodayTaskCell"
                                  forIndexPath:indexPath];
  selectedTask = self.todaysTasks[indexPath.row];
  [cell configureTask: selectedTask];
  return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
