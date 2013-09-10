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

- (void)loadView
{
    self.view = [[ORTagBasedAutoStackView alloc] init];
}

- (void)viewDidLoad
{
    ORColourView *title = [[ORColourView alloc] init];
    title.text = @"1 Title";
    title.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 40};
    title.tag = 1;

    ORColourView *subtitle = [[ORColourView alloc] init];
    subtitle.text = @"2 Subtitle";
    subtitle.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 20 };
    subtitle.tag = 2;

    ORColourView *content = [[ORColourView alloc] init];
    content.text = @"3 Lorem ipsum, etc. etc.";
    content.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 100 };
    content.tag = 3;

    ORColourView *content2 = [[ORColourView alloc] init];
    content2.text = @"4 Lorem ipsum, etc. etc.";
    content2.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 100 };
    content2.tag = 4;

    ORColourView *content3 = [[ORColourView alloc] init];
    content3.text = @"5 Lorem ipsum, etc. etc.";
    content3.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , 100 };
    content3.tag = 5;

    [self.view addSubview:subtitle withTopMargin:@"10" sideMargin:@"70"];
    [self.view addSubview:content withTopMargin:@"20" sideMargin:@"20"];
    [self.view addSubview:content3 withTopMargin:@"20" sideMargin:@"20"];
    [self.view addSubview:content2 withTopMargin:@"10" sideMargin:@"20"];
    [self.view addSubview:title withTopMargin:@"20" sideMargin:@"30"];
}

@end