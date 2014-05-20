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

    [self.view addSubview:view2 withTopMargin:@"10" sideMargin:@"40"];
    [self.view addSubview:view5 withTopMargin:@"20" sideMargin:@"20"];
    [self.view addSubview:view4 withTopMargin:@"10" sideMargin:@"20"];
    [self.view addSubview:view1 withTopMargin:@"20" sideMargin:@"30"];
}

- (void)addView
{
    if ([[self.view.subviews filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"tag = 3"]] count] > 0) return;

    ORColourView *view3 = [[ORColourView alloc] init];
    view3.text = @"tap to remove me\ntag = 3";
    view3.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 50 };
    view3.tag = 3;

    [self.view addSubview:view3 withTopMargin:@"20" sideMargin:@"70"];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTappedView:)];
    [view3 addGestureRecognizer:tapGesture];
}

- (void)removeTappedView:(UITapGestureRecognizer *)gesture
{
    [self.view removeSubview:gesture.view];
}
@end