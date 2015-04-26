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

@dynamic view;

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
    view1.text = @"Stack views can be nested inside stack views.";
    view1.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 100};

    ORColourView *view2 = [[ORColourView alloc] init];
    view2.text = @"This is an ORStackScrollView containing an ORSplitStackView.";
    view2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 80};

    ORColourView *view3 = [[ORColourView alloc] init];
    view3.text = @"a view";
    view3.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 50};

    ORSplitStackView *view4 = [[ORSplitStackView alloc] initWithLeftPredicate:@"155" rightPredicate:@"130"];
    view4.backgroundColor = [UIColor purpleColor];

    ORColourView *view5 = [[ORColourView alloc] init];
    view5.text = @"a view";
    view5.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 50};

    ORColourView *view6 = [[ORColourView alloc] init];
    view6.text = @"a view";
    view6.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 60};

    ORColourView *view7 = [[ORColourView alloc] init];
    view7.text = @"a view";
    view7.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 50};

    ORColourView *left1 = [[ORColourView alloc] init];
    left1.text = @"Tap Me";
    left1.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 55};

    ORColourView *right1 = [[ORColourView alloc] init];
    right1.text = @"Tap Me";
    right1.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 20};

    UITapGestureRecognizer *leftGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addView:)];
    [left1 addGestureRecognizer:leftGesture];
    UITapGestureRecognizer *rightGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addView:)];
    [right1 addGestureRecognizer:rightGesture];

    ORColourView *left2 = [[ORColourView alloc] init];
    left2.text = @"a view";
    left2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};

    ORColourView *left3 = [[ORColourView alloc] init];
    left3.text = @"a view";
    left3.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 45};

    ORColourView *right2 = [[ORColourView alloc] init];
    right2.text = @"a view";
    right2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 35};

    ORColourView *right3 = [[ORColourView alloc] init];
    right3.text = @"a view";
    right3.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 50};
    
    [view4.leftStack addSubview:left1 withStartMargin:0.0 sideMargin:10.0];
    [view4.leftStack addSubview:left2 withStartMargin:10.0 sideMargin:5.0];
    [view4.leftStack addSubview:left3 withStartMargin:10.0 sideMargin:15.0];
    [view4.rightStack addSubview:right1 withStartMargin:0.0 sideMargin:15.0];
    [view4.rightStack addSubview:right2 withStartMargin:10.0 sideMargin:10.0];
    [view4.rightStack addSubview:right3 withStartMargin:10.0 sideMargin:5.0];
    
    [self.view.stackView addSubview:view1 withStartMargin:20.0 sideMargin:40.0];
    [self.view.stackView addSubview:view2 withStartMargin:10.0 sideMargin:30.0];
    [self.view.stackView addSubview:view3 withStartMargin:10.0 sideMargin:35.0];
    [self.view.stackView addSubview:view4 withStartMargin:15.0 sideMargin:30.0];
    [self.view.stackView addSubview:view5 withStartMargin:20.0 sideMargin:15.0];
    [self.view.stackView addSubview:view6 withStartMargin:10.0 sideMargin:20.0];
    [self.view.stackView addSubview:view7 withStartMargin:15.0 sideMargin:30.0];

}

- (void)addView:(UITapGestureRecognizer *)gesture
{
    ORColourView *view = [[ORColourView alloc] init];
    view.text = @"Tap to remove";
    view.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40 };
    [(ORStackView *)gesture.view.superview addSubview:view withStartMargin:5.0 sideMargin:10.0];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTappedView:)];
    [view addGestureRecognizer:tapGesture];
}

- (void)removeTappedView:(UITapGestureRecognizer *)gesture
{
    [(ORStackView *)gesture.view.superview removeSubview:gesture.view];
}

@end
