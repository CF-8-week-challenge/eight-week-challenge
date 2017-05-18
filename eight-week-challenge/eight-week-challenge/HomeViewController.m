//
//  HomeViewController.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "HomeViewController.h"
#import "LeaderboardCell.h"
#import "LoginOptionsViewController.h"
@import AFNetworking;
#import "PoopHeap.h"

@interface HomeViewController () <UICollectionViewDataSource,
                                  UICollectionViewDelegate>
@property(weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(strong, nonatomic) NSArray *leaderBoardItems;
@end

@implementation HomeViewController

- (void)viewDidLoad {
  [super viewDidLoad];
    
  self.collectionView.delegate = self;
  self.collectionView.dataSource = self;
  UINib *leaderboardCell = [UINib nibWithNibName:@"LeaderboardCell" bundle:nil];
  [self.collectionView registerNib:leaderboardCell
        forCellWithReuseIdentifier:@"LeaderboardCell"];
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  self.leaderBoardItems = [PoopHeap.shared getLeaderBoard];
  [self.collectionView reloadData];
  NSLog(@"%@", self.leaderBoardItems);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return self.leaderBoardItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  LeaderboardCell *cell;
  cell = (LeaderboardCell *)[collectionView
      dequeueReusableCellWithReuseIdentifier:@"LeaderboardCell"
                                forIndexPath:indexPath];
  LeaderboardItem *selectedItem =
  [LeaderboardItem itemFromDict:self.leaderBoardItems[indexPath.row]];
  [cell configureItem:selectedItem];
  return cell;
}

- (void)collectionView:(UICollectionView *)collectionView
    didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"selected item %@", indexPath);
}


@end
