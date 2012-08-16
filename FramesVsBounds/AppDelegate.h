//
//  AppDelegate.h
//  FramesVsBounds
//
//  Created by Panupan Sriautharawong on 8/16/12.
//  Copyright (c) 2012 WILL Interactive, Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property IBOutlet NSTextField *descriptionTextField;
@property IBOutlet NSTextField *frameTextField;
@property IBOutlet NSTextField *boundsTextField;
@property IBOutlet NSButton *applyButton;
@property IBOutlet NSButton *nextButton;

- (IBAction)onNext:(id)sender;
- (IBAction)onApply:(id)sender;
@end
