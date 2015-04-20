//
//  ORStackView.m
//  ORStackView
//
//  Created by Orta on 10/09/2013.
//  Copyright (c) 2014 Orta. All rights reserved.
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

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;

    [self _setup];

    return self;
}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (void)awakeFromNib
{
    [self _setup];
}

- (void)_setup
{
    _viewStack = [NSMutableArray array];
    _bottomMarginHeight = 0;
}

- (void)updateConstraints
{
    // Remove all constraints
    for (StackView *stackView in self.viewStack) {
        [self removeConstraint:stackView.topConstraint];
    }

    // Add the new constraints
    for (StackView *stackView in self.viewStack) {
        UIView *view = stackView.view;
        NSString *predicate = @(stackView.constant).stringValue;
        NSInteger index = [self.viewStack indexOfObject:stackView];

        if (index == 0) {
            if (self.topLayoutGuide) {
                id topLayoutGuide = self.topLayoutGuide;
                NSString *vhl = [NSString stringWithFormat:@"V:[topLayoutGuide]-%@-[view]", predicate];
                NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:vhl options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(view, topLayoutGuide)];
                [self addConstraints:constraints];
                stackView.topConstraint = [constraints firstObject];
            } else {
                stackView.topConstraint = [[view alignTopEdgeWithView:self predicate:predicate] lastObject];
            }
        } else {

            UIView *viewAbove = [self.viewStack[index - 1] view];
            stackView.topConstraint = [[view constrainTopSpaceToView:viewAbove predicate:predicate] lastObject];
        }
    }

    if (self.bottomMarginHeight != NSNotFound) {
        [self removeConstraint:self.bottomConstraint];
        UIView *lastView = self.lastView;
        if (self.lastView) {
            NSString *constraint = [NSString stringWithFormat:@"%0.0f", self.bottomMarginHeight];
            self.bottomConstraint = [[self alignBottomEdgeWithView:lastView predicate:constraint] lastObject];
        }
    }

    [super updateConstraints];
}

#pragma mark - Adding Subviews

- (void)addSubview:(UIView *)view withTopMargin:(CGFloat)margin
{
    [self _addSubview:view withTopMargin:margin centered:NO sideMargin:0];
}

- (void)addSubview:(UIView *)view withTopMargin:(CGFloat)topMargin sideMargin:(CGFloat)sideMargin
{
    [self _addSubview:view withTopMargin:topMargin centered:YES sideMargin:sideMargin];
}

- (void)_addSubview:(UIView *)view withTopMargin:(CGFloat)topMargin centered:(BOOL)centered sideMargin:(CGFloat)sideMargin
{
    NSInteger index = self.viewStack.count;
    [self _insertSubview:view atIndex:index withTopMargin:topMargin centered:centered sideMargin:sideMargin];
}

#pragma mark - Inserting Subviews

- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index withTopMargin:(CGFloat)margin;
{
    [self _insertSubview:view atIndex:index withTopMargin:margin centered:NO sideMargin:0];
}

- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index withTopMargin:(CGFloat)topMargin sideMargin:(CGFloat)sideMargin
{
    [self _insertSubview:view atIndex:index withTopMargin:topMargin centered:YES sideMargin:sideMargin];
}


- (void)insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview withTopMargin:(CGFloat)margin
{
    BOOL hasSibling = [self.subviews containsObject:siblingSubview];
    NSInteger index = hasSibling ? [self indexOfView:siblingSubview] : self.viewStack.count;
    [self _insertSubview:view atIndex:index withTopMargin:margin centered:NO sideMargin:0];
}

- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview withTopMargin:(CGFloat)margin
{
    NSAssert([self.subviews containsObject:siblingSubview], @"SiblingSubview not found in ORStackView");

    NSInteger index = [self indexOfView:siblingSubview] - 1;
    [self _insertSubview:view atIndex:index withTopMargin:margin centered:NO sideMargin:0];
}

- (void)_insertSubview:(UIView *)view atIndex:(NSInteger)index withTopMargin:(CGFloat)topMargin centered:(BOOL)centered sideMargin:(CGFloat)sideMargin
{
    NSParameterAssert(view);
    if ([self.subviews containsObject:view]) return;

    [super addSubview:view];

    StackView *stackView = [[StackView alloc] init];
    stackView.view = view;
    stackView.constant = topMargin;
    [self.viewStack insertObject:stackView atIndex:index];

    if (centered) {
        [view constrainWidthToView:self predicate:@(-sideMargin).stringValue];
        [view alignCenterXWithView:self predicate:nil];
    }

    if (!self.batchingUpdates) [self setNeedsUpdateConstraints];
}

#pragma mark Removal

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

- (void)removeAllSubviews
{
    for (StackView *stackView in [self.viewStack copy]) {
        [self.viewStack removeObject:stackView];
        [stackView.view removeFromSuperview];
    }

    if (!self.batchingUpdates) [self setNeedsUpdateConstraints];
}

#pragma mark Batching

- (void)performBatchUpdates:(void (^)(void))updates;
{
    NSParameterAssert(updates);

    self.batchingUpdates = YES;
    updates();
    self.batchingUpdates = NO;

    [self setNeedsUpdateConstraints];
}

- (void)addViewController:(UIViewController *)viewController toParent:(UIViewController *)parentViewController withTopMargin:(CGFloat)margin
{
    [viewController willMoveToParentViewController:parentViewController];
    [parentViewController addChildViewController:viewController];
    [self addSubview:viewController.view withTopMargin:margin];
    [viewController didMoveToParentViewController:parentViewController];
}

- (void)addViewController:(UIViewController *)viewController toParent:(UIViewController *)parentViewController withTopMargin:(CGFloat)margin sideMargin:(CGFloat)sideMargin;
{
    [viewController willMoveToParentViewController:parentViewController];
    [parentViewController addChildViewController:viewController];
    [self addSubview:viewController.view withTopMargin:margin sideMargin:sideMargin];
    [viewController didMoveToParentViewController:parentViewController];
}


#pragma mark Helper functions

- (NSInteger)indexOfView:(UIView *)view
{
    for (StackView *stackView in self.viewStack) {
        if ([view isEqual:stackView.view]) {
            return [self.viewStack indexOfObject:stackView];
        }
    }
    return NSNotFound;
}

- (NSLayoutConstraint *)topConstraintForView:(UIView *)view
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

#pragma mark - Layout Guides

- (void)setTopLayoutGuide:(id<UILayoutSupport>)topLayoutGuide {
    _topLayoutGuide = topLayoutGuide;
    [self needsUpdateConstraints];
}

@end
