//
//  ORSplitStackView.m
//  ORStackView
//
//  Created by Orta on 24/10/2013.
//  Copyright (c) 2013 Orta. All rights reserved.
//

#import "ORSplitStackView.h"

@interface ORSplitStackView ()
@end

@implementation ORSplitStackView

- (instancetype)initWithLeftPredicate:(NSString *)left rightPredicate:(NSString *)right
{
    self = [super init];

    ORStackView *leftStack = [[ORStackView alloc] init];
    ORStackView *rightStack = [[ORStackView alloc] init];

    _leftStack = leftStack;
    _rightStack = rightStack;

    [self addSubview:leftStack];
    [self addSubview:rightStack];

    [_leftStack alignLeadingEdgeWithView:self predicate:nil];
    [_rightStack alignTrailingEdgeWithView:self predicate:nil];

    [self alignAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeTop ofView:_rightStack predicate:nil];
    [self alignAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeTop ofView:_leftStack predicate:nil];

    [_leftStack setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin];
    [_rightStack setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin];
    [_leftStack constrainHeightToView:self predicate:@"0@250"];
    [_rightStack constrainHeightToView:self predicate:@"0@250"];
    [_leftStack constrainHeightToView:self predicate:@"<=0@1000"];
    [_rightStack constrainHeightToView:self predicate:@"<=0@1000"];

    if (left) {
        [_leftStack constrainWidth:left];
    }

    if (right) {
        [_rightStack constrainWidth:right];
    }

    _leftStack.bottomMarginHeight = 0;
    _rightStack.bottomMarginHeight = 0;

    return self;
}

@end
