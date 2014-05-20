//
//  ORTagBasedAutoStackView.m
//  ORStackView
//
//  Created by Orta on 10/09/2013.
//  Copyright (c) 2013 Orta. All rights reserved.
//

#import "ORTagBasedAutoStackView.h"
#import "ORStackView+Private.h"

@implementation ORTagBasedAutoStackView

- (void)_addSubview:(UIView *)view withTopMargin:(NSString *)topMargin centered:(BOOL)centered sideMargin:(NSString *)sideMargin
{
    NSInteger index = self.viewStack.count;
    for (StackView *stackView in self.viewStack) {
        if (stackView.view.tag > view.tag) {
            index = [self.viewStack indexOfObject:stackView];
            break;
        }
    }
    
    [self _insertSubview:view atIndex:MAX(0, index) withTopMargin:topMargin centered:centered sideMargin:sideMargin];
}

@end