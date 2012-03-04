//
//  FXSearchBarViewController.m
//  Saturn V
//
//  Created by Leon Szpilewski on 3/4/12.
//  Copyright (c) 2012 Clawfield. All rights reserved.
//

#import "FXSearchBarViewController.h"

@interface FXSearchBarViewController ()

@end

@implementation FXSearchBarViewController {
    IBOutlet NSTextField *textField;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (IBAction) searchButtonClicked:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName: @"searchButtonClicked" object: self];
}

- (void) awakeFromNib {
    [textField becomeFirstResponder];
}

- (void) dealloc {
    NSLog(@"FXSearchBarViewController  dealloc");
}

@end
