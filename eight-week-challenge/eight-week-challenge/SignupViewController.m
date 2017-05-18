//
//  SignupViewController.m
//  eight-week-challenge
//
//  Created by Kyle Hillman on 5/16/17.
//  Copyright © 2017 Kyle Hillman. All rights reserved.
//

#import "SignupViewController.h"
#import "HomeViewController.h"
#import "PoopHeap.h"

@import AFNetworking;

@interface SignupViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *heightField;
@property (weak, nonatomic) IBOutlet UITextField *weightField;
@property (weak, nonatomic) IBOutlet UITextField *dobField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UITextField *groupName;
@end

@implementation SignupViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (IBAction)signupButtonPressed:(id)sender {
  [self persistToPoopHeap];
  
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
  HomeViewController *tabController = [storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
  [self presentViewController:tabController animated:YES completion:nil];
}

- (IBAction)viewTapped:(id)sender {
    [[self view] endEditing:YES];
}
- (IBAction)picPressed:(id)sender {
    NSLog(@"pic is tapped");
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePicker animated:YES completion:NULL];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *selectedImage = info[UIImagePickerControllerEditedImage];
    self.profilePic.image = selectedImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void) persistToPoopHeap {
  [PoopHeap.shared setCurrentUserEmail:self.emailField.text];
  [PoopHeap.shared setCurrentUserName:self.nameField.text];
  
  NSDictionary *user = @{ @"name": self.nameField.text,
                          @"email": self.emailField.text,
                          @"height": self.heightField.text,
                          @"weight": self.weightField.text,
                          @"dob": self.dobField.text,
                          @"groupName": self.groupName.text };

  NSDictionary *group = @{ @"name": self.nameField.text,
                           @"startDate": [[NSDate alloc] init],
                           @"adminEmail": user[@"email"] };

  [PoopHeap.shared addUser: user];
  [PoopHeap.shared addGroup: group];
}

@end
