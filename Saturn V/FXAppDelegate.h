//
//  FXAppDelegate.h
//  Saturn V
//
//  Created by Leon Szpilewski on 3/4/12.
//  Copyright (c) 2012 Clawfield. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FXAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

- (IBAction) spawnBar:(id)sender;

@end
