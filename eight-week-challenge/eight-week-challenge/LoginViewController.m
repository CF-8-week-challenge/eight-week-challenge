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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)loginButtonPressed:(id)sender {
//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
//    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:self.usernameField.text password:self.passwordField.text];
//
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    
//    [manager GET:@"https://effortmanager-staging.herokuapp.com/api/user/login" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
        
  [PoopHeap.shared setCurrentUserEmail:self.usernameField.text];
  
  NSDictionary *user = @{ @"name": @"Jane Doe",
                          @"email": self.usernameField.text,
                          @"groupName": @"Boulder Beauties" };

  NSDictionary *group = @{ @"name": @"Boulder Beauties",
                           @"startDate": [[NSDate alloc] init],
                           @"adminEmail": user[@"email"] };

  [PoopHeap.shared addUser: user];
  [PoopHeap.shared addGroup: group];
  
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HomeViewController *tabController = [storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];

        [self presentViewController:tabController animated:YES completion:nil];
        
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
}

@end
