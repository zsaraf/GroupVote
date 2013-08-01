//
//  ViewController.m
//  GroupVote
//
//  Created by Alex Grover on 7/15/13.
//  Copyright (c) 2013 Alex Grover. All rights reserved.
//

#import "LoginViewController.h"
#import "UserDetailsViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation LoginViewController

@synthesize activityIndicator = _activityIndicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    //[testObject setObject:@"bar" forKey:@"foo"];
    //[testObject save];
    
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 20)];
//    [[button titleLabel] setTextAlignment:NSTextAlignmentCenter];
//    [button setBackgroundColor:[UIColor blueColor]];
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [button setCenter:self.view.center];
//    [button addTarget:self action:@selector(loginButtonTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
//    [button setTitle:@"Login" forState:UIControlStateNormal];
//    [self.view addSubview:button];
//    [self.view setUserInteractionEnabled:YES];
}

- (IBAction)loginButtonTouchHandler:(id)sender  {
    // The permissions requested from the user
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    
    // Login PFUser using Facebook
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        [_activityIndicator stopAnimating]; // Hide loading indicator
        
        if (!user) {
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
            }
        } else if (user.isNew) {
            NSLog(@"User with facebook signed up and logged in!");
            //[self.navigationController pushViewController:[[UserDetailsViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
            [self presentViewController:[[UserDetailsViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES completion:^{}];
        } else {
            NSLog(@"User with facebook logged in!");
            //[self.navigationController pushViewController:[[UserDetailsViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
            [self presentViewController:[[UserDetailsViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES completion:^{}];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
