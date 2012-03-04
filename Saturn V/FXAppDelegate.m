//
//  FXAppDelegate.m
//  Saturn V
//
//  Created by Leon Szpilewski on 3/4/12.
//  Copyright (c) 2012 Clawfield. All rights reserved.
//

#import "FXAppDelegate.h"
#import "FXSearchWindowController.h"

@implementation FXAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction) spawnBar:(id)sender {
    FXSearchWindowController *wc = [[FXSearchWindowController alloc] initWithWindowNibName:@"FXSearchWindowController"];
    [wc showWindow: self];
}

@end
