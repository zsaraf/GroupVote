//
//  AppDelegate.h
//  GroupVote
//
//  Created by Alex Grover on 7/15/13.
//  Copyright (c) 2013 Alex Grover. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "GroupVoteSidePanelController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) GroupVoteSidePanelController *sidePanelController;

@end
