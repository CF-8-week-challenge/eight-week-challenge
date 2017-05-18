//
//  LoginViewController.m
//  eight-week-challenge
//
//  Created by Kyle Hillman on 5/16/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"
#import "PoopHeap.h"

@import AFNetworking;

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (IBAction)loginButtonPressed:(id)sender {
  [PoopHeap.shared setCurrentUserEmail:self.usernameField.text];
  [PoopHeap.shared setCurrentUserName:@"Maritza Castro"];
  [PoopHeap.shared setCurrentUserImage:[UIImage imageNamed:@"face"]];
  [PoopHeap.shared setCurrentUserAge:@"31"];
  [PoopHeap.shared setCurrentUserHeight:@"5' 6\""];
  [PoopHeap.shared setCurrentUserWeight:@"145 lbs."];
  
  NSDictionary *user = @{ @"name": @"Jane Doe",
                          @"email": self.usernameField.text,
                          @"groupName": @"Boulder Beauties" };
  
  NSDictionary *group = @{ @"name": @"Boulder Betties",
                           @"startDate": [[NSDate alloc] init],
                           @"adminEmail": user[@"email"] };
  
  [PoopHeap.shared addUser: user];
  [PoopHeap.shared addGroup: group];
  
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
  HomeViewController *tabController = [storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];

  [self presentViewController:tabController animated:YES completion:nil];
}
- (IBAction)viewTapped:(id)sender {
    [[self view] endEditing:YES];
}

@end
