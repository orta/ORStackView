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
@property (nonatomic, strong) ORStackView *view;
@end

@implementation ORFirstViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)loadView
{
    self.view = [[ORStackView alloc] init];

    if ([self respondsToSelector:@selector(topLayoutGuide)]) {
        self.view.topLayoutGuide = self.topLayoutGuide;
    }
}

- (void)viewDidLoad
{
    ORColourView *view1 = [[ORColourView alloc] init];
    view1.text = @"ORStackView - Tap Me";
    view1.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addView)];
    [view1 addGestureRecognizer:tapGesture];

    ORColourView *view2 = [[ORColourView alloc] init];
    view2.text = @"Subtitle";
    view2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 20 };

    ORColourView *view3 = [[ORColourView alloc] init];
    view3.text = @"By default, new subviews are added to the bottom of the stack view.";
    view3.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 100 };

    [self.view addSubview:view1 withTopMargin:@"20" sideMargin:@"30"];
    [self.view addSubview:view2 withTopMargin:@"40" sideMargin:@"70"];
    [self.view addSubview:view3 withTopMargin:@"30" sideMargin:@"20"];
}

- (void)addView
{
    ORColourView *content = [[ORColourView alloc] init];
    content.text = @"Tap to remove";
    content.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 24 };
    [self.view addSubview:content withTopMargin:@"5" sideMargin:@"40"];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTappedView:)];
    [content addGestureRecognizer:tapGesture];
}

- (void)removeTappedView:(UITapGestureRecognizer *)gesture
{
    [self.view removeSubview:gesture.view];
}

@end
