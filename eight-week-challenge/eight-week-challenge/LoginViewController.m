//
//  LoginViewController.m
//  eight-week-challenge
//
//  Created by Kyle Hillman on 5/16/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "LoginViewController.h"

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
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [manager GET:@"https://effortmanager-staging.herokuapp.com/api/user/signin" parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        [self dismissViewControllerAnimated:NO completion:nil];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    NSURLCredential *credential;
    NSDictionary *credentials;
    
    NSURL *url = [NSURL URLWithString:@"http://www.example.com"];
    NSURLProtectionSpace *loginProtectionSpace = [[NSURLProtectionSpace alloc] initWithHost:url.host
                                                                                       port:[url.port integerValue]
                                                                                   protocol:url.scheme
                                                                                      realm:nil
                                                                       authenticationMethod:NSURLAuthenticationMethodHTTPDigest];
    
    credentials = [[NSURLCredentialStorage sharedCredentialStorage] credentialsForProtectionSpace:loginProtectionSpace];
    credential = [credentials.objectEnumerator nextObject];
    NSLog(@"User %@ already connected with password %@", credential.user, credential.password);
    
}

@end
