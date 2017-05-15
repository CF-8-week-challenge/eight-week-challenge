//
//  HomeViewController.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "HomeViewController.h"
#import "LeaderboardCell.h"

@interface HomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
  @property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
  @property (strong, nonatomic) NSArray *leaderBoardItems;
@end

@implementation HomeViewController
  
- (void)viewDidLoad {
  [super viewDidLoad];
  self.collectionView.delegate = self;
  self.collectionView.dataSource = self;
  self.leaderBoardItems = @[
    [LeaderboardItem itemFromDict: @{@"name": @"Ulya", @"score": @50}],
    [LeaderboardItem itemFromDict: @{@"name": @"Natasha", @"score": @40}],
    [LeaderboardItem itemFromDict: @{@"name": @"Olga", @"score": @35}]
  ];

  UINib *leaderboardCell = [UINib nibWithNibName:@"LeaderboardCell" bundle:nil];
  [self.collectionView registerNib:leaderboardCell
        forCellWithReuseIdentifier:@"LeaderboardCell"];
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
