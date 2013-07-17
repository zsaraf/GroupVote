//
//  MainTableViewCell.h
//  VoteMePractice
//
//  Created by Zachary Waleed Saraf on 6/8/13.
//  Copyright (c) 2013 Zachary Waleed Saraf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResponseUIView.h"

@class MainTableViewCell;
@protocol MainTableViewCellDelegate <NSObject>
-(void)tableCellWasTapped:(MainTableViewCell *)cell;

@end

@interface MainTableViewCell : UITableViewCell <UIScrollViewDelegate>

-(void)increaseCellSizeToFit;
-(void)revertCellSize;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) ResponseUIView *redView, *whiteView, *blueView;
@property (nonatomic, strong) id<MainTableViewCellDelegate> delegate;
@property (nonatomic, strong) NSNumber *rowNum;
@property (nonatomic, strong) UIImageView *imgView;

@end
