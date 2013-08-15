//
//  MainNavigationController.m
//  GroupVote
//
//  Created by Raymond Kennedy on 7/31/13.
//  Copyright (c) 2013 Alex Grover. All rights reserved.
//

#import "MainNavigationController.h"
#import "GroupVoteSidePanelController.h"
#import "GroupVoteUtil.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  
  // Get the storyboard
  UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];

  if (![[PFUser currentUser] isAuthenticated] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
    LoginViewController *lvc = [mainStoryboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
      [[GroupVoteUtil groupVoteSharedAppDelegate].sidePanelController setAllowLeftSwipe:NO];
      [[GroupVoteUtil groupVoteSharedAppDelegate].sidePanelController setAllowRightSwipe:NO];
    self.viewControllers = [NSArray arrayWithObject:lvc];
  } else {
    HomeViewController *hvc = [mainStoryboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    self.viewControllers = [NSArray arrayWithObject:hvc];
  }
}

@end
