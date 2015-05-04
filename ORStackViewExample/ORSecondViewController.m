//
//  ORSecondViewController.m
//  ARAutoLayoutStackExample
//
//  Created by Orta on 15/08/2013.
//  Copyright (c) 2013 Orta. All rights reserved.
//

#import "ORSecondViewController.h"
#import "ORColourView.h"
#import <ORStackView/ORStackView.h>

// More complex use case: Inserting 

@interface ORSecondViewController ()
@property (nonatomic, strong) ORStackView *stackView;
@end

@implementation ORSecondViewController

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
    view1.text = @"1 - ORStackView - Tap Me";
    view1.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addView)];
    [view1 addGestureRecognizer:tapGesture];

    ORColourView *view2 = [[ORColourView alloc] init];
    view2.text = @"2 - You can control the order your ORStackView's subviews";
    view2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 50 };

    ORColourView *view3 = [[ORColourView alloc] init];
    view3.text = @"3 - Lorem ipsum, etc. etc.";
    view3.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 20 };

    ORColourView *view4 = [[ORColourView alloc] init];
    view4.text = @"4 - Lorem ipsum, etc. etc.";
    view4.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 20 };
    
    [self.stackView insertSubview:view2 atIndex:0 withPrecedingMargin:20.0 sideMargin:20.0];
    [self.stackView insertSubview:view4 atIndex:1 withPrecedingMargin:15.0 sideMargin:20.0];
    [self.stackView insertSubview:view1 atIndex:0 withPrecedingMargin:10.0 sideMargin:20.0];
    [self.stackView insertSubview:view3 atIndex:2 withPrecedingMargin:10.0 sideMargin:20.0];
}

- (void)addView
{
    ORColourView *view = [[ORColourView alloc] init];
    view.text = @"new view added at index 2\nTap to remove";
    view.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 50 };
    
    [self.stackView insertSubview:view atIndex:2 withPrecedingMargin:10.0 sideMargin:10.0];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTappedView:)];
    [view addGestureRecognizer:tapGesture];
}

- (void)removeTappedView:(UITapGestureRecognizer *)gesture
{
    [self.stackView removeSubview:gesture.view];
}
@end
