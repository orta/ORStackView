//
//  ORSecondViewControllerTests.m
//  ORStackViewExample
//
//  Created by Daniel Doubrovkine on 6/6/14.
//  Copyright (c) 2014 Orta. All rights reserved.
//

#import "../ORStackViewExample/ORSecondViewController.h"

SpecBegin(ORSecondViewController)

__block UIWindow *window;

beforeEach(^{
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
});

it(@"default", ^{
    ORSecondViewController *vc = [[ORSecondViewController alloc] init];
    window.rootViewController = vc;
    expect(vc.view).willNot.beNil();
    [window makeKeyAndVisible];
    expect(window).will.haveValidSnapshotNamed(@"default");
});

SpecEnd