//
//  MainNavigationController.m
//  GroupVote
//
//  Created by Raymond Kennedy on 7/31/13.
//  Copyright (c) 2013 Alex Grover. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  
  // Get the storyboard
  UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];

  if (![[PFUser currentUser] isAuthenticated]) {
    LoginViewController *lvc = [mainStoryboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    self.viewControllers = [NSArray arrayWithObject:lvc];
  } else {
    HomeViewController *hvc = [mainStoryboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    self.viewControllers = [NSArray arrayWithObject:hvc];
  }
}

@end
