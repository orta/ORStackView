//
//  ORStackView.m
//  ARAutoLayoutStackExample
//
//  Created by Orta on 10/09/2013.
//  Copyright (c) 2013 Orta. All rights reserved.
//

#import "ORStackView.h"
#import <FLKAutoLayout/UIView+FLKAutoLayout.h>
#import "ORStackView+Private.h"

@interface ORStackView()

/// Delay updating constraints when true
@property (nonatomic, assign) BOOL batchingUpdates;
@property (nonatomic, strong) NSLayoutConstraint *bottomConstraint;

@end

@implementation ORStackView

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;

    _viewStack = [NSMutableArray array];
    _bottomMarginHeight = NSNotFound;

    return self;
}

- (void)updateConstraints
{
    // Remove all constraints
    for (StackView *stackView in self.viewStack) {
        [stackView.view removeConstraint:stackView.topConstraint];
    }

    // Add the new constraints
    for (StackView *stackView in self.viewStack) {
        UIView *view = stackView.view;
        NSString *predicate = stackView.constraintPredicate;
        NSInteger index = [self.viewStack indexOfObject:stackView];

        if (index == 0) {
            stackView.topConstraint = [[view alignTopEdgeWithView:self predicate:predicate] lastObject];
        } else {

            UIView *viewAbove = [self.viewStack[index - 1] view];
            stackView.topConstraint = [[view constrainTopSpaceToView:viewAbove predicate:predicate] lastObject];
        }
    }

    if (self.bottomMarginHeight != NSNotFound) {
        [self removeConstraint:self.bottomConstraint];

        NSString *constraint = [NSString stringWithFormat:@"%0.0f", self.bottomMarginHeight];
        UIView *lastView = self.lastView;
        self.bottomConstraint = [[self alignBottomEdgeWithView:lastView predicate:constraint] lastObject];
    }

    [super updateConstraints];
}

#pragma mark - Adding Subviews

- (void)addSubview:(UIView *)view withTopMargin:(NSString *)margin
{
    [self _addSubview:view withTopMargin:margin centered:NO sideMargin:nil];
}

- (void)addSubview:(UIView *)view withTopMargin:(NSString *)topMargin sideMargin:(NSString *)sideMargin
{
    [self _addSubview:view withTopMargin:topMargin centered:YES sideMargin:sideMargin];
}

- (void)_addSubview:(UIView *)view withTopMargin:(NSString *)topMargin centered:(BOOL)centered sideMargin:(NSString *)sideMargin
{
    NSInteger index = self.viewStack.count;
    [self _insertSubview:view atIndex:index withTopMargin:topMargin centered:centered sideMargin:sideMargin];
}

#pragma mark - Inserting Subviews

- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index withTopMargin:(NSString *)margin;
{
    [self _insertSubview:view atIndex:index withTopMargin:margin centered:NO sideMargin:nil];
}

- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index withTopMargin:(NSString *)topMargin sideMargin:(NSString *)sideMargin
{
    [self _insertSubview:view atIndex:index withTopMargin:topMargin centered:YES sideMargin:sideMargin];
}


- (void)insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview withTopMargin:(NSString *)margin
{
    BOOL hasSibling = [self.subviews containsObject:siblingSubview];
    NSInteger index = hasSibling ? [self indexOfView:siblingSubview] : self.viewStack.count;
    [self _insertSubview:view atIndex:index withTopMargin:margin centered:NO sideMargin:nil];
}

- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview withTopMargin:(NSString *)margin
{
    NSAssert([self.subviews containsObject:siblingSubview], @"SiblingSubview not found in ORStackView");

    NSInteger index = [self indexOfView:siblingSubview] - 1;
    [self _insertSubview:view atIndex:index withTopMargin:margin centered:NO sideMargin:nil];
}

- (void)_insertSubview:(UIView *)view atIndex:(NSInteger)index withTopMargin:(NSString *)topMargin centered:(BOOL)centered sideMargin:(NSString *)sideMargin
{
    NSParameterAssert(view);
    if ([self.subviews containsObject:view]) return;
    
    [super addSubview:view];

    StackView *stackView = [[StackView alloc] init];
    stackView.view = view;
    stackView.constraintPredicate = topMargin;
    [self.viewStack insertObject:stackView atIndex:index];

    if (centered) {
        NSString *invertedSideMargin = nil;
        if ([sideMargin rangeOfString:@"-"].location == NSNotFound) {
            invertedSideMargin = [@"-" stringByAppendingString:sideMargin];
        } else {
            invertedSideMargin = [sideMargin stringByReplacingOccurrencesOfString:@"-" withString:@""];
        }

        [view constrainWidthToView:self predicate:invertedSideMargin];
        [view alignCenterXWithView:self predicate:nil];
    }

    if (!self.batchingUpdates) [self setNeedsUpdateConstraints];
}

- (void)removeSubview:(UIView *)subview
{
    if (![self.subviews containsObject:subview]) return;

    [subview removeFromSuperview];

    for (StackView *stackView in self.viewStack.copy) {
        if ([subview isEqual:stackView.view]) {
            [self.viewStack removeObject:stackView];
        }
    }

    if (!self.batchingUpdates) [self setNeedsUpdateConstraints];
}

- (void)performBatchUpdates:(void (^)(void))updates;
{
    NSParameterAssert(updates);

    self.batchingUpdates = YES;
    updates();
    self.batchingUpdates = NO;

    [self setNeedsUpdateConstraints];
}

- (NSInteger)indexOfView:(UIView *)view
{
    for (StackView *stackView in self.viewStack) {
        if ([view isEqual:stackView.view]) {
            return [self.viewStack indexOfObject:stackView];
        }
    }
    return NSNotFound;
}

- (NSLayoutConstraint *)topContraintForView:(UIView *)view
{
    for (StackView *stackView in self.viewStack) {
        if ([view isEqual:stackView.view]) {
            return stackView.topConstraint;
        }
    }
    return nil;
}

- (UIView *)lastView
{
    return [[self.viewStack lastObject] view];
}

@end
