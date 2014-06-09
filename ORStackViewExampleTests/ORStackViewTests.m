//
//  OREmptyViewControllerTests.m
//  ORStackViewExample
//
//  Created by Daniel Doubrovkine on 6/6/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

#import <ORStackView/ORStackView.h>

SpecBegin(ORStackView)

__block UIWindow *window;

beforeEach(^{
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
});

describe(@"bottomMarginHeight", ^{
    it(@"works with an empty stack view", ^{
        UIViewController *vc = [[UIViewController alloc] init];
        window.rootViewController = vc;
        ORStackView *view = [[ORStackView alloc] initWithFrame:vc.view.bounds];
        view.bottomMarginHeight = 10;
        [vc.view addSubview:view];
        [view setNeedsUpdateConstraints];
        [window makeKeyAndVisible];
        expect(window).will.haveValidSnapshotNamed(@"bottomMarginHeightWithEmptyStackView");
    });
});

SpecEnd