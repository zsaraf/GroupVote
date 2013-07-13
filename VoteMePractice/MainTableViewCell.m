//
//  MainTableViewCell.m
//  MessAroundVote
//
//  Created by Zachary Saraf on 6/21/13.
//  Copyright (c) 2013 Zachary Saraf. All rights reserved.
//

#import "MainTableViewCell.h"
#import "ResponseUIView.h"

@implementation MainTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(UILabel *)addLabelInView:(UIView *)view withText:(NSString *)text andAdd:(BOOL)add inColor:(UIColor *)color
{
    CGFloat padding = 15.;
    
    UIFont *font = [UIFont fontWithName:@"Helvetica-Light" size:24];
    CGSize size = [text sizeWithFont:font];
    
    CGRect frame = CGRectMake(padding, view.bounds.size.height/2 - size.height/2
                              , size.width + padding, size.height);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setFont:font];
    [label setTextColor:color];
    [label setBackgroundColor:[view backgroundColor]];
    [label setText:text];
    
    if (add) [view addSubview:label];
    return label;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        UIColor *whiteColor = [UIColor colorWithRed:1. green:253/255. blue:253/255. alpha:.8];
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.redView = [[ResponseUIView alloc] initWithFrame:self.bounds];
        [self.redView setBackgroundColor:[UIColor colorWithRed:.9 green:.3 blue:.2 alpha:1.]];
        self.redView.label = [self addLabelInView:self.redView withText:@"Red Label" andAdd:YES inColor:whiteColor];
        
        self.whiteView = [[ResponseUIView alloc] initWithFrame:CGRectMake(self.scrollView.bounds.size.width, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height)];
        [self.whiteView setBackgroundColor:whiteColor];
        self.whiteView.label = [self addLabelInView:self.whiteView withText:@"White Label" andAdd:YES inColor:[UIColor blackColor]];
        
        self.blueView = [[ResponseUIView alloc] initWithFrame:CGRectMake(self.scrollView.bounds.size.width * 2, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height)];
        [self.blueView setBackgroundColor:[UIColor colorWithRed:0.322 green:.612 blue:1.0 alpha:1.0]];
        self.blueView.label = [self addLabelInView:self.blueView withText:@"Blue Label" andAdd:YES inColor:whiteColor];
        
        [self.scrollView addSubview:self.redView];
        [self.scrollView addSubview:self.whiteView];
        [self.scrollView addSubview:self.blueView];
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.bounds.size.width, 0.)];
        [self.scrollView setContentSize:CGSizeMake(self.scrollView.bounds.size.width * 3, self.scrollView.bounds.size.height)];
        [self.scrollView setPagingEnabled:YES];
        [self.scrollView setDelegate:self];
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewTapped:)];
        [self.scrollView addGestureRecognizer:recognizer];
        
        [self addSubview:self.scrollView];
        
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(-40, 20, 0, 0)];
        [self.imgView setImage:[UIImage imageNamed:@"ZachImage.jpg"]];
        [self.whiteView addSubview:self.imgView];
        
    }
    NSLog(@"Good");
    return self;
}

-(void)increaseCellSizeToFit
{
    NSLog(@"Now increasing cell size");
    CGRect frame = [[self scrollView] frame];
    frame.size.height = 100;
    [[self scrollView] setFrame:frame];
    CGRect whiteViewFrame = [self.whiteView frame];
    whiteViewFrame.size.height = 100;
    [[self whiteView] setFrame:whiteViewFrame];
    
    CGRect frameImgView = [self.imgView frame];
    frameImgView.origin.x = 10;
    [UIView animateWithDuration:.5 animations:^{
        [self.imgView setFrame:CGRectMake(
                                     20, self.scrollView.frame.size.height/2 - 30, 60, 60)];
        [[[self whiteView] label] setCenter:CGPointMake([self.scrollView center].x, self.whiteView.center.y)];
    }];
}

-(void)revertCellSize
{
    CGRect frame = [[self scrollView] frame];
    frame.size.height = 60;
    [[self scrollView] setFrame:frame];
    CGRect whiteViewFrame = [self.whiteView frame];
    whiteViewFrame.size.height = 60;
    [[self whiteView] setFrame:whiteViewFrame];
    
    
    CGRect newLabelFrame = [self whiteView].label.frame;
    newLabelFrame.origin.y = frame.size.height/2 - newLabelFrame.size.height/2;
    
    newLabelFrame.origin.x = 15.;
    
    [UIView animateWithDuration:.5 animations:^{
        [self.imgView setFrame:CGRectMake(-40, 20, 0, 0)];
        [[[self whiteView] label] setFrame:newLabelFrame];
    }];
}

-(int) getPageForScrollView
{
    return floor(self.scrollView.contentOffset.x/self.bounds.size.width);
}

-(void)scrollViewTapped:(UIGestureRecognizer *)recognizer
{
    [self.delegate tableCellWasTapped:self];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"SCROLLED");
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = floor(scrollView.contentOffset.x /self.bounds.size.width);
    if (page == 1) return;
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    UIColor *color;
    if (page == 0) color = [UIColor redColor];
    if (page == 2) color = [UIColor blueColor];
    
    [self addSubview:view];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    return;
    // Configure the view for the selected state
}

@end

        //[self.colorView setBackgroundColor:[UIColor colorWithRed:0.322 green:.612 blue:1.0 alpha:1.0]];
//[self.colorView setBackgroundColor:[UIColor colorWithRed:.9 green:.3 blue:.2 alpha:1.]];
