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
#import "TaskCatalog.h"

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

  self.todaysTasks = [Task tasksForToday];
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
