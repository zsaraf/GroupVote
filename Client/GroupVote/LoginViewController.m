//
//  ViewController.m
//  GroupVote
//
//  Created by Alex Grover on 7/15/13.
//  Copyright (c) 2013 Alex Grover. All rights reserved.
//

#import "LoginViewController.h"
#import "UserDetailsViewController.h"
#import "GroupVoteUtil.h"

@interface LoginViewController ()

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation LoginViewController

@synthesize activityIndicator = _activityIndicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
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
            
            // Setup the PF Installation
            [self addInstallation];
            [self goToHomeView];
        } else {
            
            // Setup the PF Installation
            [self addInstallation];
            [self goToHomeView];
        }
    }];
}

- (void)addInstallation
{
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setObject:[PFUser currentUser] forKey:@"owner"];
    [currentInstallation saveInBackground];
}

- (void)goToHomeView {
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    HomeViewController *hvc = [mainStoryboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    [[GroupVoteUtil groupVoteSharedAppDelegate].sidePanelController setAllowRightSwipe:YES];
    [[GroupVoteUtil groupVoteSharedAppDelegate].sidePanelController setAllowLeftSwipe:YES];
    [self.navigationController setViewControllers:[NSArray arrayWithObject:hvc] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
