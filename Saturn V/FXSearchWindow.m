//
//  FXSearchWindow.m
//  Saturn V
//
//  Created by Leon Szpilewski on 3/4/12.
//  Copyright (c) 2012 Clawfield. All rights reserved.
//

#import "FXSearchWindow.h"
#import "FXSearchWindowContentView.h"
@implementation FXSearchWindow

- (id)initWithContentRect:(NSRect)contentRect
                styleMask:(NSUInteger)aStyle
                  backing:(NSBackingStoreType)bufferingType
                    defer:(BOOL)flag {
    // Using NSBorderlessWindowMask results in a window without a title bar.
//    self = [super initWithContentRect:contentRect styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:flag];
#ifdef FX_BORDERLESS
        self = [super initWithContentRect:contentRect styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:flag];
    if (self != nil) {
        // Start with no transparency for all drawing into the window
        [self setOpaque: NO];
        [self setAlphaValue: 1.0];
        [self setBackgroundColor: [NSColor clearColor]];
        [self setHasShadow: YES];

        // Turn off opacity so that the parts of the window that are not drawn into are transparent.
        
        [self setMovableByWindowBackground:YES];
        [self setLevel:NSNormalWindowLevel];
        //[self setContentView: [[FXSearchWindowContentView alloc] initWithFrame: contentRect]];
        
    }
#else
    self = [super initWithContentRect: contentRect 
                            styleMask: aStyle 
                              backing: bufferingType
                                defer: flag];
#endif
    return self;
}
- (void) awakeFromNib {
    [self setHasShadow: YES];
}
- (BOOL) canBecomeKeyWindow
{
    return YES;
}
@end
