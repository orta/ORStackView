//
//  ARSplitStackView.h
//  ORStackView
//
//  Created by Orta on 24/10/2013.
//  Copyright (c) 2013 Orta. All rights reserved.
//

#import "ORStackView.h"

@interface ORSplitStackView : UIView

- (instancetype)initWithLeftPredicate:(NSString *)left rightPredicate:(NSString *)right;

@property (nonatomic, weak, readonly) ORStackView *leftStack;
@property (nonatomic, weak, readonly) ORStackView *rightStack;

@end
