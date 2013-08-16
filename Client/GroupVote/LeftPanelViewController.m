//
//  LeftPanelViewController.m
//  GroupVote
//
//  Created by Zachary Waleed Saraf on 8/15/13.
//  Copyright (c) 2013 Alex Grover. All rights reserved.
//

#import "LeftPanelViewController.h"
#import "GroupTableViewCell.h"
#import "GroupVoteUtil.h"

@interface LeftPanelViewController ()

@property (nonatomic, assign) CGFloat oldSearchBarSize;

@end

@implementation LeftPanelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
        
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setEdgesForExtendedLayout:UIRectEdgeTop];
        [self setAutomaticallyAdjustsScrollViewInsets:NO];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"groupCell";
    GroupTableViewCell *cell = (GroupTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[GroupTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"OKAy");
}

-(void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller
{
    [[GroupVoteUtil groupVoteSharedAppDelegate].sidePanelController setCenterPanelHidden:YES animated:YES duration:.3];
    self.oldSearchBarSize = self.searchBarWrapperView.frame.size.width;
    [UIView animateWithDuration:.3 animations:^{
        [self.searchBarWrapperView setFrame:CGRectMake(self.searchBarWrapperView.frame.origin.x, self.searchBarWrapperView.frame.origin.y, self.view.frame.size.width, self.searchBarWrapperView.frame.size.height)];
    }];
}

-(void)searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller
{
    [controller setActive:NO];
    

    [[GroupVoteUtil groupVoteSharedAppDelegate].sidePanelController setCenterPanelHidden:NO animated:YES duration:.3];
    [UIView animateWithDuration:.3 animations:^{
        [self.searchBarWrapperView setFrame:CGRectMake(self.searchBarWrapperView.frame.origin.x, self.searchBarWrapperView.frame.origin.y, self.oldSearchBarSize, self.searchBarWrapperView.frame.size.height)];
    }];
}

-(void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller
{
    
}


@end
