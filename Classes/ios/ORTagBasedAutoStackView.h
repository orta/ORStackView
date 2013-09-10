//
//  ORTagBasedAutoStackView.h
//  ARAutoLayoutStackExample
//
//  Created by Orta on 10/09/2013.
//  Copyright (c) 2013 Orta. All rights reserved.
//

#import "ORStackView.h"

/// A ORStackView subclass that will use view.tag intergers to determine
/// the order of a view heirarchy. Will add above any view with a number higher
/// therefore 0 is the top.

@interface ORTagBasedAutoStackView : ORStackView


// Please don't use the insert methods on this class
- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index withTopMargin:(NSString *)margin __attribute__((unavailable("Inserting subviews is not supported on ORTagBasedAutoStackView.")));

- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index withTopMargin:(NSString *)topMargin sideMargin:(NSString *)sideMargin __attribute__((unavailable("Inserting subviews is not supported on ORTagBasedAutoStackView.")));

- (void)insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview withTopMargin:(NSString *)margin __attribute__((unavailable("Inserting subviews is not supported on ORTagBasedAutoStackView.")));

- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview withTopMargin:(NSString *)margin __attribute__((unavailable("Inserting subviews is not supported on ORTagBasedAutoStackView.")));

@end
