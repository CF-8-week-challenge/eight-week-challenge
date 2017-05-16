//
//  HomeViewController.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "HomeViewController.h"
#import "LeaderboardCell.h"
#import "StartDate.h"
@import AFNetworking;

@interface HomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
  @property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
  @property (strong, nonatomic) NSArray *leaderBoardItems;
@end

@implementation HomeViewController
  
- (void)viewDidLoad {
  [super viewDidLoad];
    [StartDate currentWeekAndDayFromStartDate:[StartDate formatDate:@"2017-05-01"]];
  self.collectionView.delegate = self;
  self.collectionView.dataSource = self;
  UINib *leaderboardCell = [UINib nibWithNibName:@"LeaderboardCell" bundle:nil];
  [self.collectionView registerNib:leaderboardCell
        forCellWithReuseIdentifier:@"LeaderboardCell"];

  NSString *leaderboardUrlString = @"https://demo2029138.mockable.io/leaderboard";
  AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
  [manager GET:leaderboardUrlString
    parameters:nil
      progress:nil
       success:^(NSURLSessionTask *task, id responseObject) {
         NSArray *leaderboardEntries = responseObject[@"leaderboard"];
         self.leaderBoardItems = [LeaderboardItem itemsFromDicts: leaderboardEntries];
         [self.collectionView reloadData];
       } failure:^(NSURLSessionTask *operation, NSError *error) {
         NSLog(@"Error: %@", error);
       }]; 
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return self.leaderBoardItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  LeaderboardCell *cell;
  cell = (LeaderboardCell*)
  [collectionView dequeueReusableCellWithReuseIdentifier:@"LeaderboardCell"
                                            forIndexPath:indexPath];
  LeaderboardItem *selectedItem = self.leaderBoardItems[indexPath.row];
  [cell configureItem: selectedItem];
  return cell;
}

- (void)collectionView:(UICollectionView *)collectionView
  didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"selected item %@", indexPath);
}

@end
