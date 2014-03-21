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
    ORColourView *title = [[ORColourView alloc] init];
    title.text = @"1 - Title";
    title.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};

    ORColourView *subtitle = [[ORColourView alloc] init];
    subtitle.text = @"2 - Subtitle";
    subtitle.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 20 };

    ORColourView *content = [[ORColourView alloc] init];
    content.text = @"3 - Lorem ipsum, etc. etc.";
    content.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 100 };

    ORColourView *content2 = [[ORColourView alloc] init];
    content2.text = @"4 - Lorem ipsum, etc. etc.";
    content2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 100 };

    [self.view insertSubview:title atIndex:0 withTopMargin:@"10" sideMargin:@"20"];
    [self.view insertSubview:subtitle atIndex:1 withTopMargin:@"20" sideMargin:@"20"];
    [self.view insertSubview:content2 atIndex:2 withTopMargin:@"40" sideMargin:@"20"];
    [self.view insertSubview:content atIndex:2 withTopMargin:@"30" sideMargin:@"20"];
}

@end
