//
//  HomeViewController.m
//  eight-week-challenge
//
//  Created by Jake Romer on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
  @property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation HomeViewController
  
- (void)viewDidLoad {
  [super viewDidLoad];
  self.collectionView.delegate = self;
  self.collectionView.dataSource = self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  UICollectionViewCell *cell;
  cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell"
                                                   forIndexPath:indexPath];
  return cell;
}

- (void)collectionView:(UICollectionView *)collectionView
  didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"selected item %@", indexPath);
}

@end
