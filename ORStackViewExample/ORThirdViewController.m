//
//  ORThirdViewController.m
//  ARAutoLayoutStackExample
//
//  Created by Orta on 10/09/2013.
//  Copyright (c) 2013 Orta. All rights reserved.
//

#import "ORThirdViewController.h"
#import "ORColourView.h"
#import <ORStackView/ORTagBasedAutoStackView.h>

// More complex use case: Using tags to ensure order whilst adding in another order

@interface ORThirdViewController()
@property (nonatomic, strong) ORTagBasedAutoStackView *stackView;
@end

@implementation ORThirdViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)loadView
{
    self.view = [[UIView alloc] init];
}

- (void)viewDidLoad
{
    self.stackView = [[ORTagBasedAutoStackView alloc] init];
    [self.view addSubview:self.stackView];
    if ([self respondsToSelector:@selector(topLayoutGuide)]) {
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    }
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];

    ORColourView *view1 = [[ORColourView alloc] init];
    view1.text = @"Tap Me\ntag = 1";
    view1.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 70};
    view1.tag = 1;

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addView)];
    [view1 addGestureRecognizer:tapGesture];

    ORColourView *view2 = [[ORColourView alloc] init];
    view2.text = @"ORTagBasedAutoStackView uses view tags to order your subviews\ntag = 2";
    view2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 70 };
    view2.tag = 2;

    ORColourView *view4 = [[ORColourView alloc] init];
    view4.text = @"tag = 4";
    view4.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 50 };
    view4.tag = 4;

    ORColourView *view5 = [[ORColourView alloc] init];
    view5.text = @"tag = 5";
    view5.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 60 };
    view5.tag = 5;

    [self.stackView addSubview:view2 withTopMargin:10.0 sideMargin:40.0];
    [self.stackView addSubview:view5 withTopMargin:20.0 sideMargin:20.0];
    [self.stackView addSubview:view4 withTopMargin:10.0 sideMargin:20.0];
    [self.stackView addSubview:view1 withTopMargin:20.0 sideMargin:30.0];
}

- (void)addView
{
    if ([[self.stackView.subviews filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"tag = 3"]] count] > 0) return;

    ORColourView *view3 = [[ORColourView alloc] init];
    view3.text = @"tap to remove me\ntag = 3";
    view3.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 50 };
    view3.tag = 3;

    [self.stackView addSubview:view3 withTopMargin:20.0 sideMargin:70.0];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTappedView:)];
    [view3 addGestureRecognizer:tapGesture];
}

- (void)removeTappedView:(UITapGestureRecognizer *)gesture
{
    [self.stackView removeSubview:gesture.view];
}
@end