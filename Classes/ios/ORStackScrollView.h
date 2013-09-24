//
//  ORStackScrollView.h
//  ARAutoLayoutStackExample
//
//  Created by Orta on 10/09/2013.
//  Copyright (c) 2013 Orta. All rights reserved.
//

/// A view that will handle vertical stacking subviews for you
/// allowing arbitrary insertion or removal

#import "ORStackScrollView.h"
#import "ORStackView.h"

@interface ORStackScrollView : UIScrollView

@property (nonatomic, strong, readonly) ORStackView *stackView;

/// TODO: Optional init method inacse you want to use a subview
//  - (instancetype)initWithStackViewClass:(Class)klass;

@end
