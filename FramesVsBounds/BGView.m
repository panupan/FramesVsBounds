//
//  BGView.m
//  FramesVsBounds
//
//  Created by Panupan Sriautharawong on 8/16/12.
//  Copyright (c) 2012 WILL Interactive, Inc. All rights reserved.
//

#import "BGView.h"

@implementation BGView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        self.backgroundColor = [NSColor blackColor];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
    [self.backgroundColor setFill];
    NSRectFill(self.bounds);
}

@end
