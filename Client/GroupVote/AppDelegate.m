//
//  AppDelegate.m
//  GroupVote
//
//  Created by Alex Grover on 7/15/13.
//  Copyright (c) 2013 Alex Grover. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "MainNavigationController.h"
#import "LeftPanelViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"NSUCiOCLNN8c7MJ24TViMk4J6wLE8Ueshns8CL0a"
                  clientKey:@"JYQbzJkCYavQ1O9mCUUSBQzJIi7TpkIm4bME9yEO"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    [PFFacebookUtils initializeFacebook];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
    LeftPanelViewController *leftVC = [storyboard instantiateViewControllerWithIdentifier:@"leftSidePanel"];
    UIViewController *rightVC = [[UIViewController alloc] init];
    [rightVC.view setBackgroundColor:[UIColor redColor]];
    self.sidePanelController = [[GroupVoteSidePanelController alloc] init];
    NSLog(@"%f", self.sidePanelController.leftVisibleWidth);
    [self.sidePanelController setLeftPanel: leftVC];
    [self.sidePanelController setRightPanel:rightVC];
    
    MainNavigationController  *navController= [storyboard instantiateViewControllerWithIdentifier:@"MainNavigationController"];
    [self.sidePanelController setCenterPanel:navController];
    [self.window setRootViewController:self.sidePanelController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [PFFacebookUtils handleOpenURL:url];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
