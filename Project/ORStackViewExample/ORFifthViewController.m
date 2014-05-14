//
//  ORFifthViewController.m
//  ORStackViewExample
//
//  Created by Laura Brown on 5/13/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

#import "ORFifthViewController.h"
#import "ORColourView.h"
#import <ORStackView/ORSplitStackView.h>
#import <ORStackView/ORStackScrollView.h>

@interface ORFifthViewController ()
@property (nonatomic, strong) ORStackScrollView *view;
@end

@implementation ORFifthViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)loadView
{
    self.view = [[ORStackScrollView alloc] initWithStackViewClass:[ORStackView class]];
}

- (void)viewDidLoad
{

    ORColourView *view1 = [[ORColourView alloc] init];
    view1.text = @"An ORStackView containing an ORSplitStackView";
    view1.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 60};

    ORSplitStackView *view2 = [[ORSplitStackView alloc] initWithLeftPredicate:@"155" rightPredicate:@"130"];

    view2.backgroundColor = [UIColor purpleColor];
    ORColourView *left1 = [[ORColourView alloc] init];
    left1.text = @"Tap Me";
    left1.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 30};

    ORColourView *right1 = [[ORColourView alloc] init];
    right1.text = @"Tap Me";
    right1.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 20};

    UITapGestureRecognizer *leftGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addView:)];
    [left1 addGestureRecognizer:leftGesture];
    UITapGestureRecognizer *rightGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addView:)];
    [right1 addGestureRecognizer:rightGesture];

    ORColourView *left2 = [[ORColourView alloc] init];
    left2.text = @"a view";
    left2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 50};

    ORColourView *left3 = [[ORColourView alloc] init];
    left3.text = @"a view";
    left3.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 25};

    ORColourView *right2 = [[ORColourView alloc] init];
    right2.text = @"a view";
    right2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 25};

    ORColourView *right3 = [[ORColourView alloc] init];
    right3.text = @"a view";
    right3.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};

    [view2.leftStack addSubview:left1 withTopMargin:@"0" sideMargin:@"10"];
    [view2.leftStack addSubview:left2 withTopMargin:@"10" sideMargin:@"5"];
    [view2.leftStack addSubview:left3 withTopMargin:@"10" sideMargin:@"15"];
    [view2.rightStack addSubview:right1 withTopMargin:@"0" sideMargin:@"15"];
    [view2.rightStack addSubview:right2 withTopMargin:@"10" sideMargin:@"10"];
    [view2.rightStack addSubview:right3 withTopMargin:@"10" sideMargin:@"5"];

    ORColourView *bottomView = [[ORColourView alloc] init];
    bottomView.text = @"ORSplitStackView (above) adjusts its height to fit its content";
    bottomView.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 50};

    [self.view.stackView addSubview:view1 withTopMargin:@"20" sideMargin:@"10"];
    [self.view.stackView addSubview:view2 withTopMargin:@"15" sideMargin:@"30"];
    [self.view.stackView addSubview:bottomView withTopMargin:@"10" sideMargin:@"20"];

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
