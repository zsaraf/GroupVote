//
//  MainTableViewHeaderView.m
//  VoteMePractice
//
//  Created by Zachary Waleed Saraf on 6/22/13.
//  Copyright (c) 2013 Zachary Waleed Saraf. All rights reserved.
//

#import "MainTableViewHeaderView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MainTableViewHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer setBorderColor:[[UIColor blackColor] CGColor]];
        [self.layer setBorderWidth:2];
        self.groupImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ZachImage.jpg"]];
        [self calculatePictureRectCoordinates];
        [self addSubview:self.groupImage];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self calculatePictureRectCoordinates];
}

-(void)willMoveToWindow:(UIWindow *)newWindow
{
    [self calculatePictureRectCoordinates];
}


-(void)calculatePictureRectCoordinates
{
    CGFloat heightAndWidth = self.frame.size.height - 20;
    [self.groupImage setFrame:CGRectMake(10, 10, heightAndWidth, heightAndWidth)];
}


@end
