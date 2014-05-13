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

@interface ORFourthViewController ()
@property (nonatomic, strong) ORSplitStackView *view;
@end

@implementation ORFourthViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)loadView
{
    self.view = [[ORSplitStackView alloc] initWithLeftPredicate:@"100" rightPredicate:@"200"];
}

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor blueColor];
    self.view.leftStack.backgroundColor = [UIColor purpleColor];
    self.view.rightStack.backgroundColor = [UIColor orangeColor];
    ORColourView *left1 = [[ORColourView alloc] init];
    left1.text = @"L 1 - Tap Me";
    left1.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};

    ORColourView *right1 = [[ORColourView alloc] init];
    right1.text = @"R 1 - Tap Me";
    right1.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addView:)];
    [left1 addGestureRecognizer:tapGesture];
    [right1 addGestureRecognizer:tapGesture];

    ORColourView *left2 = [[ORColourView alloc] init];
    left2.text = @"R 1 - Tap Me";
    left2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};

    ORColourView *right2 = [[ORColourView alloc] init];
    right2.text = @"R 2";
    right2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};

    ORColourView *right3 = [[ORColourView alloc] init];
    right3.text = @"R 3";
    right3.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};

    ORColourView *right4 = [[ORColourView alloc] init];
    right4.text = @"R 4";
    right4.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};
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
