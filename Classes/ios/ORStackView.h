//
//  ORStackView.h
//  ORStackView
//
//  Created by Orta on 10/09/2013.
//  Copyright (c) 2013 Orta. All rights reserved.
//

/// A view that will handle vertical stacking subviews for you
/// allowing arbitrary insertion or removal

@interface ORStackView : UIView

/// Adds a view to the heirarchy, if it's the first it is
/// attached to the top, otherwise to the view above.
- (void)addSubview:(UIView *)view withTopMargin:(NSString *)margin;

/// Adds a view to the heirarchy like addSubview:withTopMargin:
/// will also center and apply side margins as insets from edge
- (void)addSubview:(UIView *)view withTopMargin:(NSString *)topMargin sideMargin:(NSString *)sideMargin;

/// Adds a view controller's view to the stack heirarchy
- (void)addViewController:(UIViewController *)viewController toParent:(UIViewController *)parentViewController withTopMargin:(NSString *)margin;

/// Adds a view controller's view to the stack heirarchy, and applys edge insets
- (void)addViewController:(UIViewController *)viewController toParent:(UIViewController *)parentViewController withTopMargin:(NSString *)margin sideMargin:(NSString *)sideMargin;


// Note: These indexes are not z-order, but stack order.
//  z-index ordering can be done with the UIView methods bringSubviewToFront:

/// Insert a subview at an arbitrary index in the stack's order
- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index withTopMargin:(NSString *)margin;

/// Inserts a subview and centeres it
- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index withTopMargin:(NSString *)topMargin sideMargin:(NSString *)sideMargin;

/// Insert a subview below another view, or at the end if it cannot be found
- (void)insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview withTopMargin:(NSString *)margin;

/// Insert a subview above another view, will assert if view is not found
- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview withTopMargin:(NSString *)margin;

/// Remove a subview from the Stack View
- (void)removeSubview:(UIView *)subview;

/// Remove all subviews from the Stack View
- (void)removeAllSubviews;

/// Perform insertion / removals without updating the constraints
- (void)performBatchUpdates:(void (^)(void))updates;


// Useful getters

/// Returns the top constraint for a specific view
- (NSLayoutConstraint *)topContraintForView:(UIView *)view;

/// Returns the lowest view in the stack.
- (UIView *)lastView;

/// Setting this creates a bottom constraint letting the ORStackView set it's own height, defaults to NSNotFound
@property (nonatomic, assign) CGFloat bottomMarginHeight;

/// Settings this will create a constraint on the top view making the view sit below the layout guide (and the top margin)
@property (nonatomic, strong) id<UILayoutSupport> topLayoutGuide;

/// I'd prefer you to not use the UIView subview APIs please, things will break.
- (void)addSubview:(UIView *)view __attribute__((unavailable("addSubview is not supported on ORStackView.")));

- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index __attribute__((unavailable("insertSubview is not supported on ORStackView.")));
- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview __attribute__((unavailable("insertSubview is not supported on ORStackView.")));
- (void)insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview __attribute__((unavailable("insertSubview is not supported on ORStackView.")));

@end
