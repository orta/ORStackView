//
//  ORFirstViewController.m
//  ARAutoLayoutStackExample
//
//  Created by Orta on 15/08/2013.
//  Copyright (c) 2013 Orta. All rights reserved.
//

#import "ORFirstViewController.h"
#import "ORColourView.h"
#import <ORStackView/ORStackView.h>

// Simplest use case: Adding views in order

@interface ORFirstViewController ()
@property (nonatomic, strong) ORStackView *stackView;
@end

@implementation ORFirstViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)loadView
{
    self.view = [[UIView alloc] init];
}

- (void)viewDidLoad
{
    self.stackView = [[ORStackView alloc] init];
    [self.view addSubview:self.stackView];
    if ([self respondsToSelector:@selector(topLayoutGuide)]) {
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    }
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];

    ORColourView *view1 = [[ORColourView alloc] init];
    view1.text = @"ORStackView - Tap Me";
    view1.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addView)];
    [view1 addGestureRecognizer:tapGesture];

    ORColourView *view2 = [[ORColourView alloc] init];
    view2.text = @"Subtitle";
    view2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 20 };

    ORColourView *view3 = [[ORColourView alloc] init];
    view3.text = @"By default, new subviews are added to the bottom of ORStackView.";
    view3.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 100 };

    [self.stackView addSubview:view1 withTopMargin:20.0 sideMargin:30.0];
    [self.stackView addSubview:view2 withTopMargin:40.0 sideMargin:70.0];
    [self.stackView addSubview:view3 withTopMargin:30.0 sideMargin:20.0];
}

- (void)addView
{
    ORColourView *view = [[ORColourView alloc] init];
    view.text = @"Tap to remove";
    view.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 24 };
    [self.stackView addSubview:view withTopMargin:5.0 sideMargin:40.0];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTappedView:)];
    [view addGestureRecognizer:tapGesture];
}

- (void)removeTappedView:(UITapGestureRecognizer *)gesture
{
    [self.stackView removeSubview:gesture.view];
}

@end
