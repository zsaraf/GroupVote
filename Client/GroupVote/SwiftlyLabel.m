//
//  SwiftlyLabel.m
//  GroupVote
//
//  Created by Raymond Kennedy on 7/31/13.
//  Copyright (c) 2013 Alex Grover. All rights reserved.
//

#import "SwiftlyLabel.h"

@implementation SwiftlyLabel

#define SPACING 2

// Set the label to use custom fonts
- (void)awakeFromNib
{
  [super awakeFromNib];
  self.font = [UIFont fontWithName:@"BebasNeue" size:self.font.pointSize];
  [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + SPACING, self.frame.size.width, self.frame.size.height)];
}

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.font = [UIFont fontWithName:@"BebasNeue" size:self.font.pointSize];
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + SPACING, self.frame.size.width, self.frame.size.height)];
  }
  return self;
}

@end
