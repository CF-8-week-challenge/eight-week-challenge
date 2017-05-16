//
//  ProfileViewController.m
//  eight-week-challenge
//
//  Created by Kyle Hillman on 5/15/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "ProfileViewController.h"

@import AFNetworking;

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self getUserInfo];
}

-(NSDate *)formatDate:(NSString *)date {
  NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
  NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
  [formatter setLocale:locale];
  [formatter setDateFormat:@"yyyy-MM-dd"];
  return [formatter dateFromString:date];
}

-(void)getUserInfo {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"https://demo2029138.mockable.io/user"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSDictionary *user = (NSDictionary *)responseObject;
            NSNumber *userHeight = user[@"userProfile"][@"height"];
            NSNumber *userWeight = user[@"userProfile"][@"currentWeight"];
            NSDate *userAge = [self formatDate:user[@"userProfile"][@"dateOfBirth"]];
            NSDate *date1 = [NSDate date];
            //UIImage *userPic = user[@"userProfile"][@"avatarUrl"];
            
            NSTimeInterval secondsBetween = [date1 timeIntervalSinceDate:userAge];
            
            int numberOfDays = secondsBetween / 86400;
            int years = numberOfDays / 365;
            
            self.nameLabel.text = user[@"userProfile"][@"name"];
            self.profilePic.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:user[@"userProfile"][@"avatarUrl"]]]];
            self.heightLabel.text = [NSString stringWithFormat:@"%@", [userHeight stringValue]];
            self.weightLabel.text = [NSString stringWithFormat:@"%@", [userWeight stringValue]];
            self.ageLabel.text = [NSString stringWithFormat:@"%d", years];
        }
    }];
    
    [dataTask resume];
    
}

- (IBAction)historyButtonPressed:(id)sender {
}

@end
