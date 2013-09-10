//
//  ARColourView.m
//  AutolayoutExample
//
//  Created by Orta on 27/06/2013.
//  Copyright (c) 2013 Orta. All rights reserved.
//

#import "ORColourView.h"

@implementation UIColor (DebugColours)

+ (UIColor *)debugColourRandom {
    uint32_t index = arc4random_uniform(360);
    return [UIColor colorWithHue:index/360.0 saturation:0.398 brightness:0.773 alpha:1.000];
}

@end


@implementation ORColourView

- (id)init {
    self = [super init];
    if (!self) return nil;

    self.backgroundColor = [UIColor debugColourRandom];
    self.textAlignment = NSTextAlignmentCenter;
    self.numberOfLines = 0;
    self.userInteractionEnabled = YES;

    return self;
}

- (CGSize)intrinsicContentSize {
    if (!CGSizeEqualToSize(self.fakeContentSize, CGSizeZero)) {
        return self.fakeContentSize;
    }
    return [super intrinsicContentSize];
}

- (NSString *)description
{
    return [@"ORColourView : " stringByAppendingString: self.text];
}

@end
