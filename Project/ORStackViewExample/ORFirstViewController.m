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

- (void)loadView
{
    self.view = [[ORStackView alloc] init];
}

- (void)viewDidLoad
{
    ORColourView *title = [[ORColourView alloc] init];
    title.text = @"Title - Tap Me";
    title.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addView)];
    [title addGestureRecognizer:tapGesture];

    ORColourView *subtitle = [[ORColourView alloc] init];
    subtitle.text = @"Subtitle";
    subtitle.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 20 };

    ORColourView *content = [[ORColourView alloc] init];
    content.text = @"Lorem ipsum, etc. etc.";
    content.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 100 };

    [self.view addSubview:title withTopMargin:@"20" sideMargin:@"30"];
    [self.view addSubview:subtitle withTopMargin:@"10" sideMargin:@"70"];
    [self.view addSubview:content withTopMargin:@"60" sideMargin:@"20"];
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
