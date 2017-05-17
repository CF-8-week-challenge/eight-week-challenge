//
//  LoginOptionsViewController.m
//  eight-week-challenge
//
//  Created by Kyle Hillman on 5/16/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "LoginOptionsViewController.h"
#import "LoginViewController.h"
#import "SignupViewController.h"

@interface LoginOptionsViewController ()

@end

@implementation LoginOptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)loginButtonPressed:(id)sender {
    LoginViewController *loginController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    [self presentViewController:loginController animated:YES completion:nil];
}

- (IBAction)signupButtonPressed:(id)sender {
    SignupViewController *signupController = [self.storyboard instantiateViewControllerWithIdentifier:@"SignupViewController"];
    
    [self presentViewController:signupController animated:YES completion:nil];
}

@end
