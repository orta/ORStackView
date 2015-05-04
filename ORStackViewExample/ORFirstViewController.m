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
    self.stackView.direction = ORStackViewDirectionHorizontal;
    
    [self.view addSubview:self.stackView];
    if ([self respondsToSelector:@selector(topLayoutGuide)]) {
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    } else {
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    }
    
    if ([self respondsToSelector:@selector(bottomLayoutGuide)]) {
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.bottomLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    } else {
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    }
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    


    ORColourView *view1 = [[ORColourView alloc] init];
    view1.text = @"ORHorizontalStackView - Tap Me";
    view1.fakeContentSize = (CGSize){ 40, UIViewNoIntrinsicMetric};

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addView)];
    [view1 addGestureRecognizer:tapGesture];

    ORColourView *view2 = [[ORColourView alloc] init];
    view2.text = @"Subtitle";
    view2.fakeContentSize = (CGSize){ 30, UIViewNoIntrinsicMetric};

    ORColourView *view3 = [[ORColourView alloc] init];
    view3.text = @"By default, new subviews are added to the right of ORHorizontalStackView.";
    view3.fakeContentSize = (CGSize){ 100, UIViewNoIntrinsicMetric };
    
    [self.stackView addSubview:view1 withPrecedingMargin:20.0 sideMargin:30.0];
    [self.stackView addSubview:view2 withPrecedingMargin:10.0 sideMargin:170.0];
    [self.stackView addSubview:view3 withPrecedingMargin:30.0 sideMargin:20.0];
}

- (void)addView
{
    ORColourView *view = [[ORColourView alloc] init];
    view.text = @"Tap to remove";
    view.fakeContentSize = (CGSize){ 24, UIViewNoIntrinsicMetric};
    [self.stackView addSubview:view withPrecedingMargin:5.0 sideMargin:40.0];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTappedView:)];
    [view addGestureRecognizer:tapGesture];
}

- (void)removeTappedView:(UITapGestureRecognizer *)gesture
{
    [self.stackView removeSubview:gesture.view];
}

@end
