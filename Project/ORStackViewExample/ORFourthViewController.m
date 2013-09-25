//
//  ORFourthViewController.m
//  ORStackViewExample
//
//  Created by Orta on 15/09/2013.
//  Copyright (c) 2013 Orta. All rights reserved.
//

#import "ORFourthViewController.h"
#import "ORColourView.h"
#import <ORStackView/ORStackScrollView.h>

// Having a scrollview that will automatically deal with
// hooking up the stack view

@interface ORFourthViewController ()
@property (nonatomic, strong) ORStackScrollView *view;
@end

@implementation ORFourthViewController

- (void)loadView
{
    self.view = [[ORStackScrollView alloc] init];
}

- (void)viewDidLoad
{
    ORColourView *title = [[ORColourView alloc] init];
    title.text = @"1 Title";
    title.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};
    title.tag = 1;

    [self.view.stackView addSubview:title withTopMargin:@"20" sideMargin:@"20"];
}

- (void)addView
{
    ORColourView *content = [[ORColourView alloc] init];
    content.text = @"Tap to remove";
    content.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 24 };
    [self.view.stackView addSubview:content withTopMargin:@"5" sideMargin:@"40"];

    [self.view flashScrollIndicators];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTappedView:)];
    [content addGestureRecognizer:tapGesture];
}

- (void)removeTappedView:(UITapGestureRecognizer *)gesture
{
    [self.view.stackView removeSubview:gesture.view];
}


@end
