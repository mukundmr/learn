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
@synthesize sidesSlider;
@synthesize lineStyleSwitch;

- (void)sliderUsed {
	aPoly.sides = (int)sidesSlider.value;
	[self setNeedsDisplay];
}

- (void)switchUsed {
	[self setNeedsDisplay];
}

- (void)updateLabel {
	sidesCount.text = [NSString stringWithFormat:@"%d", aPoly.sides];
	shapeLabel.text = [aPoly label];
	[sidesSlider setValue:aPoly.sides];
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
	int storedSides = 0;	
	aPoly = [[Poly alloc] init];
	// read stored state
	storedSides = [[NSUserDefaults standardUserDefaults] integerForKey:@"sides"];
	if (storedSides != 0) {
		aPoly.sides = storedSides;
	}
	lineStyleSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"switch"];
	// refresh display
	[self updateLabel];
}

- (void)awakeFromNib {
	// the real initializer when you use IB
	[self setDefaultValues];
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
	CGFloat dashPattern[2] = {3, 3};
	CGSize shadowSize;
	
	//set the polygon shadow size
	shadowSize.width = 2;
	shadowSize.height = -2;
	
	// get the polygon points
	polyPoints= [[NSArray alloc] initWithArray:[aPoly getPolyPoints:self.bounds]];
	// get the context before doing anything
	context = UIGraphicsGetCurrentContext();
	// set the line style
	if (lineStyleSwitch.on == TRUE) {
		CGContextSetLineDash(context, 0, dashPattern, 2);
	}
	// set the shadow
	CGContextSetShadow(context, shadowSize, 2);
	// move the graphics pen to the first point
	point = [[polyPoints objectAtIndex:0] CGPointValue];
	// generate the path
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, point.x, point.y);
	e = [polyPoints objectEnumerator];
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

- (void)saveState {
	[[NSUserDefaults standardUserDefaults] setInteger:aPoly.sides forKey:@"sides"];
	[[NSUserDefaults standardUserDefaults] setBool:lineStyleSwitch.on forKey:@"switch"];
}

- (void)dealloc {
	[aPoly release];
    [super dealloc];
}


@end
