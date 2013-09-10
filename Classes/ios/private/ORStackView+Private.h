//
//  ORStackView+Private.h
//  ARAutoLayoutStackExample
//
//  Created by Orta on 10/09/2013.
//  Copyright (c) 2013 Orta. All rights reserved.
//

#import "ORStackView.h"

// Private interfaces for ORStackView ///////////////////////

@interface StackView : NSObject
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) NSLayoutConstraint *topConstraint;
@property (nonatomic, strong) NSString *constraintPredicate;
@end

@interface ORStackView()

/// An array of StackView objects in the order they should be shown
@property (nonatomic, strong) NSMutableArray *viewStack;

- (void)_addSubview:(UIView *)view withTopMargin:(NSString *)topMargin centered:(BOOL)centered sideMargin:(NSString *)sideMargin;
- (void)_insertSubview:(UIView *)view atIndex:(NSInteger)index withTopMargin:(NSString *)topMargin centered:(BOOL)centered sideMargin:(NSString *)sideMargin;
@end
