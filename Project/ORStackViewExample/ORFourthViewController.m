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
    for (NSInteger i = 0; i < 20; i++) {
        ORColourView *title = [[ORColourView alloc] init];
        title.text = [NSString stringWithFormat:@" - %i - ", i];
        title.fakeContentSize = (CGSize){ UIViewNoIntrinsicMetric , roundf(arc4random() % 120)};

        [self.view.stackView addSubview:title withTopMargin:@"20" sideMargin:@"40"];
    }
}

@end
