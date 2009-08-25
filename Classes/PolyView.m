//
//  PolyView.m
//  objC1
//
//  Created by Mukund R on 24/08/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PolyView.h"


@implementation PolyView

@synthesize sidesCount;
@synthesize shapeLabel;

- (void)updateLabel {
	sidesCount.text = [NSString stringWithFormat:@"%d", aPoly.sides];
	shapeLabel.text = [aPoly label];
}

- (void)increase {
	[aPoly increase];
	[self setNeedsDisplay];
}

- (void)decrease {
	[aPoly decrease];
	[self setNeedsDisplay];
}

- (void)setDefaultValues {
	aPoly = [[Poly alloc] init];
	[self updateLabel];
}


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
	CGContextRef context;
	NSArray *polyPoints;
	NSEnumerator *e;
	CGPoint point;
	id iterator;
	
	polyPoints= [[NSArray alloc] initWithArray:[aPoly getPolyPoints:self.bounds]];
	e = [polyPoints objectEnumerator];
	context = UIGraphicsGetCurrentContext();
	// move the graphics pen to the first point
	point = [[polyPoints objectAtIndex:0] CGPointValue];
	// generate the path
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, point.x, point.y);
	while (iterator = [e nextObject]) {
		point = [iterator CGPointValue];
		CGContextAddLineToPoint(context, point.x, point.y);
	}
	CGContextClosePath(context);
	// draw stuff
	[[UIColor redColor] setFill];
	[[UIColor blackColor] setStroke];
	CGContextDrawPath(context, kCGPathFillStroke);
	// clean up
	[polyPoints release];
	// the label
	[self updateLabel];
}


- (void)dealloc {
    [super dealloc];
	[aPoly release];
}


@end
