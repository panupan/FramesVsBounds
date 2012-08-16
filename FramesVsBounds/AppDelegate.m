//
//  AppDelegate.m
//  FramesVsBounds
//
//  Created by Panupan Sriautharawong on 8/16/12.
//  Copyright (c) 2012 WILL Interactive, Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "BGView.h"

@implementation AppDelegate {
    BGView *redView;
    BGView *greenView;
    BGView *blueView;
    NSMutableArray *actionsArray;
    int currentIndex;
}

- (void)updateLabels
{
    NSMutableDictionary *currentAction = [actionsArray objectAtIndex:currentIndex];
    self.descriptionTextField.stringValue = [currentAction objectForKey:@"description"];
    
    self.frameTextField.stringValue = [NSString stringWithFormat:@"redView.frame: %@", NSStringFromRect(redView.frame)];
    self.boundsTextField.stringValue = [NSString stringWithFormat:@"redView.bounds: %@", NSStringFromRect(redView.bounds)];
}

- (IBAction)onNext:(id)sender
{
    NSView *contentView = self.window.contentView;
    redView.frame = NSMakeRect(0,
                               70,
                               contentView.frame.size.width,
                               contentView.frame.size.height-70);
    redView.bounds = NSMakeRect(0,
                                0,
                                contentView.frame.size.width,
                                contentView.frame.size.height-70);
    redView.boundsRotation = 0;
    
    if (currentIndex < 0 || currentIndex >= actionsArray.count-1) currentIndex = 0;
    else {
        currentIndex++;
    }
    
    [self updateLabels];
}

- (IBAction)onApply:(id)sender
{
    if ([self.descriptionTextField.stringValue isEqualToString:@"Halve redView.frame.size"]) {
        redView.frame = NSMakeRect(redView.frame.origin.x,
                                   redView.frame.origin.y,
                                   redView.frame.size.width/2,
                                   redView.frame.size.height/2);
    }
    else if ([self.descriptionTextField.stringValue isEqualToString:@"redView.bounds.origin.x += 100"]) {
        redView.bounds = NSMakeRect(redView.bounds.origin.x+100,
                                    redView.bounds.origin.y,
                                    redView.bounds.size.width,
                                    redView.bounds.size.height);
    }
    else if ([self.descriptionTextField.stringValue isEqualToString:@"Halve redView.bounds.size"]) {
        redView.bounds = NSMakeRect(redView.bounds.origin.x,
                                    redView.bounds.origin.y,
                                    redView.bounds.size.width/2,
                                    redView.bounds.size.height/2);
    }
    else if ([self.descriptionTextField.stringValue isEqualToString:@"Double redView.bounds.size"]) {
        redView.bounds = NSMakeRect(redView.bounds.origin.x,
                                    redView.bounds.origin.y,
                                    redView.bounds.size.width*2,
                                    redView.bounds.size.height*2);
    }
    else if ([self.descriptionTextField.stringValue isEqualToString:@"Scale redView by .5"]) {
        NSLog(@"redView.bounds before: %@", NSStringFromRect(redView.bounds));
        [redView scaleUnitSquareToSize:NSMakeSize(.5, .5)];
        [redView setNeedsDisplay:YES];
        NSLog(@"redView.bounds after: %@", NSStringFromRect(redView.bounds));
    }
    else if ([self.descriptionTextField.stringValue isEqualToString:@"Rotate redView"]) {
        NSLog(@"redView.bounds before: %@", NSStringFromRect(redView.bounds));
        redView.boundsRotation += 10;
        [redView setNeedsDisplay:YES];
        NSLog(@"redView.bounds after: %@", NSStringFromRect(redView.bounds));
    }
    
    [self updateLabels];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSView *contentView = self.window.contentView;
    
    actionsArray = [[NSMutableArray alloc] init];
    [actionsArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Halve redView.frame.size", @"description", nil]];
    [actionsArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"redView.bounds.origin.x += 100", @"description", nil]];
    [actionsArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Halve redView.bounds.size", @"description", nil]];
    [actionsArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Double redView.bounds.size", @"description", nil]];
    [actionsArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Scale redView by .5", @"description", nil]];
    [actionsArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Rotate redView", @"description", nil]];
    
    redView = [[BGView alloc] initWithFrame:NSMakeRect(0,
                                                       70,
                                                       contentView.frame.size.width,
                                                       contentView.frame.size.height-70)];
    redView.autoresizingMask = NSViewNotSizable;
    redView.backgroundColor = [NSColor redColor];
    [contentView addSubview:redView];

    greenView = [[BGView alloc] initWithFrame:NSMakeRect(redView.frame.size.width/2  - redView.frame.size.width/4,
                                                         redView.frame.size.height/2 - redView.frame.size.height/4,
                                                         redView.frame.size.width/2,
                                                         redView.frame.size.height/2)];
    greenView.autoresizingMask = NSViewNotSizable;
    greenView.backgroundColor = [NSColor greenColor];
    [redView addSubview:greenView];
    
    blueView = [[BGView alloc] initWithFrame:NSMakeRect(greenView.frame.size.width/2  - greenView.frame.size.width/4,
                                                        greenView.frame.size.height/2 - greenView.frame.size.height/4,
                                                        greenView.frame.size.width/2,
                                                        greenView.frame.size.height/2)];
    blueView.backgroundColor = [NSColor blueColor];
    blueView.autoresizingMask = NSViewNotSizable;
    [greenView addSubview:blueView];
    
    currentIndex=-1;
    [self onNext:nil];
}

@end
