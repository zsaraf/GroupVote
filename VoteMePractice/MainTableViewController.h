//
//  MainTableViewController.h
//  VoteMePractice
//
//  Created by Zachary Waleed Saraf on 6/8/13.
//  Copyright (c) 2013 Zachary Waleed Saraf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableViewCell.h"

@interface MainTableViewController : UITableViewController <MainTableViewCellDelegate>

@property (strong, nonatomic) NSMutableArray *cellHeights;
@property (nonatomic, assign) int numCells;
@property (nonatomic, strong) UIView *headerView;

@end
