//
//  FXSearchWindowContentView.m
//  Saturn V
//
//  Created by Leon Szpilewski on 3/4/12.
//  Copyright (c) 2012 Clawfield. All rights reserved.
//

#import "FXSearchWindowContentView.h"

@implementation FXSearchWindowContentView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (NSBezierPath *) bezierPathWithRoundedRect: (NSRect) aRect cornerRadius: (double) cRadius
{
	double left = aRect.origin.x, bottom = aRect.origin.y, width = aRect.size.width, height = aRect.size.height;
	
	//now, crop the radius so we don't get weird effects
	double lesserDim = width < height ? width : height;
	if ( cRadius > lesserDim / 2 )
	{
		cRadius = lesserDim / 2;
	}
    
	//these points describe the rectangle as start and stop points of the
	//arcs making up its corners --points c, e, & g are implicit endpoints of arcs
	//and are unnecessary
	NSPoint a = NSMakePoint( 0, cRadius ), b = NSMakePoint( 0, height - cRadius ),
    d = NSMakePoint( width - cRadius, height ), f = NSMakePoint( width, cRadius ),
    h = NSMakePoint( cRadius, 0 );
    
	//these points describe the center points of the corner arcs
	NSPoint cA = NSMakePoint( cRadius, height - cRadius ),
    cB = NSMakePoint( width - cRadius, height - cRadius ),
    cC = NSMakePoint( width - cRadius, cRadius ),
    cD = NSMakePoint( cRadius, cRadius );
    
	//start
	NSBezierPath *bp = [NSBezierPath bezierPath];
	[bp moveToPoint: a ];
	[bp lineToPoint: b ];
	[bp appendBezierPathWithArcWithCenter: cA radius: cRadius startAngle:180 endAngle:90 clockwise: YES];
	[bp lineToPoint: d ];
	[bp appendBezierPathWithArcWithCenter: cB radius: cRadius startAngle:90 endAngle:0 clockwise: YES];
	[bp lineToPoint: f ];
	[bp appendBezierPathWithArcWithCenter: cC radius: cRadius startAngle:0 endAngle:270 clockwise: YES];
	[bp lineToPoint: h ];
	[bp appendBezierPathWithArcWithCenter: cD radius: cRadius startAngle:270 endAngle:180 clockwise: YES];	
	[bp closePath];
    
	//Transform path to rectangle's origin
	NSAffineTransform *transform = [NSAffineTransform transform];
	[transform translateXBy: left yBy: bottom];
	[bp transformUsingAffineTransform: transform];
    
	return bp; //it's already been autoreleased
}


- (void)drawRect:(NSRect)rect {
    
#ifdef FX_BORDERLESS
    
    [NSGraphicsContext saveGraphicsState];
    [[NSColor colorWithPatternImage: [NSImage imageNamed: @"woodpattern.png"]] set];
    NSBezierPath *path = [self bezierPathWithRoundedRect: [self frame] cornerRadius: 6.0];
    [path addClip];
    NSRectFill([self frame]);
    //[path fill];
    
    // your drawing here...
    [NSGraphicsContext restoreGraphicsState];
    
    
    [[NSColor blackColor] set];
//    
//    [path setLineWidth: 1.0];
//    [path stroke];
#else
    [[NSColor colorWithPatternImage: [NSImage imageNamed: @"woodpattern.png"]] set];
    NSRectFill([self frame]);
#endif
}


@end
