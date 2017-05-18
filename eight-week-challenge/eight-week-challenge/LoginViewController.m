//
//  LoginViewController.m
//  eight-week-challenge
//
//  Created by Kyle Hillman on 5/16/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"

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
    
    NSDictionary *params = @{@"emailAddress": self.usernameField.text, @"password": self.passwordField.text};

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];

    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [manager GET:@"https://effortmanager-staging.herokuapp.com/api/user/login" parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HomeViewController *tabController = [storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
        
        [self presentViewController:tabController animated:YES completion:nil];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

@end
