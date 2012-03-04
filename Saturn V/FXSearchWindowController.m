//
//  FXSearchWindow.m
//  Saturn V
//
//  Created by Leon Szpilewski on 3/4/12.
//  Copyright (c) 2012 Clawfield. All rights reserved.
//

#import "FXSearchWindowController.h"
#import "FXSearchBarViewController.h"

@interface FXSearchWindowController ()

@end

@implementation FXSearchWindowController {
    FXSearchWindowController *selfRetainingReference;
    FXSearchBarViewController *searchViewController;
}

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


- (void)windowDidLoad
{
    [super windowDidLoad];
    
    //[self.window.contentView setWantsLayer: YES];
    //[self.window setOpaque: YES];
//    [self.window setAlphaValue: 0.9];
   // [self.window setBackgroundColor: [NSColor colorWithPatternImage: [NSImage imageNamed: @"woodpattern.png"]]];

    
}

- (void) createSearchView {
    searchViewController = [[FXSearchBarViewController alloc] initWithNibName: @"FXSearchBarViewController" bundle:nil];
    [searchViewController.view setFrame: [self.window.contentView frame]];
    
#if 0    
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration: 2.4];
    [[self.window.contentView animator ] addSubview: searchViewController.view];
    [NSAnimationContext endGrouping];
#else
//    //[searchViewController.view setAlphaValue: 0.0];
    [self.window.contentView addSubview: searchViewController.view];
#endif
}

- (void) searchButtonClicked: (NSNotification *) notification {
    [self close];
}

- (void) awakeFromNib {
    selfRetainingReference = self;
    [self createSearchView];
    
    [[NSNotificationCenter defaultCenter] addObserver: self 
                                             selector: @selector(searchButtonClicked:) 
                                                 name: @"searchButtonClicked"
                                               object: searchViewController];
}


- (void) close {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
    [super close];
    searchViewController = nil;
    selfRetainingReference = nil;
}

//- (void) showWindow:(id)sender {
//    [super showWindow: sender];
//    [self createSearchView];
//}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self];

    NSLog(@"window controller dealloc");
}

@end
