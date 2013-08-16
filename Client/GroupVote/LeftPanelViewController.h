//
//  LeftPanelViewController.h
//  GroupVote
//
//  Created by Zachary Waleed Saraf on 8/15/13.
//  Copyright (c) 2013 Alex Grover. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftPanelViewController : UIViewController <UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *searchBarWrapperView;

@end
