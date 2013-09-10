//
//  ARColourView.h
//  AutolayoutExample
//
//  Created by Orta on 27/06/2013.
//  Copyright (c) 2013 Orta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ORColourView : UILabel

// Fake the intrinsicContentSize so that we can say the
// size it should start as

@property (nonatomic) CGSize fakeContentSize;

@end
