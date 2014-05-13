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
@property (nonatomic, strong) ORTagBasedAutoStackView *view;
@end

@implementation ORThirdViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)loadView
{
    self.view = [[ORTagBasedAutoStackView alloc] init];

    if ([self respondsToSelector:@selector(topLayoutGuide)]) {
        self.view.topLayoutGuide = self.topLayoutGuide;
    }
}

- (void)viewDidLoad
{
    ORColourView *view1 = [[ORColourView alloc] init];
    view1.text = @"1 Title - Tap to add view #2";
    view1.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};
    view1.tag = 1;

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addView)];
    [view1 addGestureRecognizer:tapGesture];

    ORColourView *view3 = [[ORColourView alloc] init];
    view3.text = @"3 Lorem ipsum, etc. etc.";
    view3.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 60 };
    view3.tag = 3;

    ORColourView *view4 = [[ORColourView alloc] init];
    view4.text = @"4 Lorem ipsum, etc. etc.";
    view4.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 50 };
    view4.tag = 4;

    ORColourView *view5 = [[ORColourView alloc] init];
    view5.text = @"5 Lorem ipsum, etc. etc.";
    view5.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 60 };
    view5.tag = 5;

    [self.view addSubview:view3 withTopMargin:@"10" sideMargin:@"40"];
    [self.view addSubview:view5 withTopMargin:@"20" sideMargin:@"20"];
    [self.view addSubview:view4 withTopMargin:@"10" sideMargin:@"20"];
    [self.view addSubview:view1 withTopMargin:@"20" sideMargin:@"30"];
}

- (void)addView
{
    if ([[self.view.subviews filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"tag = 2"]] count] > 0) return;

    ORColourView *view2 = [[ORColourView alloc] init];
    view2.text = @"2 Subtitle - Tap To Remove";
    view2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 20 };
    view2.tag = 2;

    [self.view addSubview:view2 withTopMargin:@"10" sideMargin:@"70"];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTappedView:)];
    [view2 addGestureRecognizer:tapGesture];
}

- (void)removeTappedView:(UITapGestureRecognizer *)gesture
{
    [self.view removeSubview:gesture.view];
}
@end