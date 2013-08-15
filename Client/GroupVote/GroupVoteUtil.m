//
//  GroupVoteUtil.m
//  GroupVote
//
//  Created by Zachary Waleed Saraf on 8/14/13.
//  Copyright (c) 2013 Alex Grover. All rights reserved.
//

#import "GroupVoteUtil.h"


@interface GroupVoteUtil ()

@end

@implementation GroupVoteUtil

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(AppDelegate *)groupVoteSharedAppDelegate
{
    return (AppDelegate *)([[UIApplication sharedApplication] delegate]);
}

@end
