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
@property (nonatomic, strong) ORStackView *view;
@end

@implementation ORSecondViewController

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

    [self.view insertSubview:view2 atIndex:0 withTopMargin:@"20" sideMargin:@"20"];
    [self.view insertSubview:view4 atIndex:1 withTopMargin:@"15" sideMargin:@"20"];
    [self.view insertSubview:view1 atIndex:0 withTopMargin:@"10" sideMargin:@"20"];
    [self.view insertSubview:view3 atIndex:2 withTopMargin:@"10" sideMargin:@"20"];
}

- (void)addView
{
    ORColourView *view = [[ORColourView alloc] init];
    view.text = @"new view added at index 2\nTap to remove";
    view.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 50 };

    [self.view insertSubview:view atIndex:2 withTopMargin:@"10" sideMargin:@"10"];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTappedView:)];
    [view addGestureRecognizer:tapGesture];
}

- (void)removeTappedView:(UITapGestureRecognizer *)gesture
{
    [self.view removeSubview:gesture.view];
}
@end
