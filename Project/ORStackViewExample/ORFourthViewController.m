//
//  ORFourthViewController.m
//  ORStackViewExample
//
//  Created by Laura Brown on 5/13/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

#import "ORFourthViewController.h"
#import "ORColourView.h"
#import <ORStackView/ORSplitStackView.h>

@implementation ORFourthViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)loadView
{
    self.view = [[UIView alloc] init];
}

- (void)viewDidLoad
{
    ORSplitStackView *splitView = [[ORSplitStackView alloc] initWithLeftPredicate:@"155" rightPredicate:@"130"];
    [self.view addSubview:splitView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:splitView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    if ([self respondsToSelector:@selector(topLayoutGuide)]) {
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:splitView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    }
    
    splitView.backgroundColor = [UIColor purpleColor];
    ORColourView *left1 = [[ORColourView alloc] init];
    left1.text = @"Tap Me";
    left1.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 50};

    ORColourView *right1 = [[ORColourView alloc] init];
    right1.text = @"Tap Me";
    right1.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 60};

    UITapGestureRecognizer *leftGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addView:)];
    [left1 addGestureRecognizer:leftGesture];
    UITapGestureRecognizer *rightGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addView:)];
    [right1 addGestureRecognizer:rightGesture];

    ORColourView *left2 = [[ORColourView alloc] init];
    left2.text = @"ORSplitStackView is a view containing two stack views.";
    left2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 90};

    ORColourView *left3 = [[ORColourView alloc] init];
    left3.text = @"ORSplitStackView adjusts its height to fit its content";
    left3.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 75};

    ORColourView *right2 = [[ORColourView alloc] init];
    right2.text = @"a view";
    right2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 45};

    ORColourView *right3 = [[ORColourView alloc] init];
    right3.text = @"a view";
    right3.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};

    [splitView.leftStack addSubview:left1 withTopMargin:@"0" sideMargin:@"10"];
    [splitView.leftStack addSubview:left2 withTopMargin:@"10" sideMargin:@"5"];
    [splitView.leftStack addSubview:left3 withTopMargin:@"10" sideMargin:@"15"];
    [splitView.rightStack addSubview:right1 withTopMargin:@"0" sideMargin:@"15"];
    [splitView.rightStack addSubview:right2 withTopMargin:@"10" sideMargin:@"10"];
    [splitView.rightStack addSubview:right3 withTopMargin:@"10" sideMargin:@"5"];
}

- (void)addView:(UITapGestureRecognizer *)gesture
{
    ORColourView *view = [[ORColourView alloc] init];
    view.text = @"Tap to remove";
    view.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 24 };
    [(ORStackView *)gesture.view.superview addSubview:view withTopMargin:@"5" sideMargin:@"10"];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTappedView:)];
    [view addGestureRecognizer:tapGesture];
}

- (void)removeTappedView:(UITapGestureRecognizer *)gesture
{
    [(ORStackView *)gesture.view.superview removeSubview:gesture.view];
}

@end
