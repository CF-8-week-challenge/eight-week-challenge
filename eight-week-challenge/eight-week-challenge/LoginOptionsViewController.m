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

    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)([UIColor colorWithRed:0.804 green:0.506 blue:0.506 alpha:1.000].CGColor),(id)([UIColor colorWithRed:0.694 green:0.439 blue:0.439 alpha:1.000].CGColor),(id)([UIColor colorWithRed:0.533 green:0.329 blue:0.329 alpha:1.000].CGColor),(id)([UIColor colorWithRed:0.451 green:0.275 blue:0.278 alpha:1.000].CGColor),(id)([UIColor colorWithRed:0.239 green:0.141 blue:0.145 alpha:1.000].CGColor),nil];
    gradient.startPoint = CGPointMake(0.50,0.00);
    gradient.endPoint = CGPointMake(0.50,1.00);
    [self.view.layer insertSublayer:gradient atIndex:0];
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
