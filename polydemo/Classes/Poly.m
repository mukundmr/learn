//
//  Poly.m
//  objC1
//
//  Created by Mukund R on 19/08/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Poly.h"
#import "Math.h"


@implementation Poly

@synthesize sides;
@synthesize names;

- (id) init {
	if (self = [super init]) {
		min_sides = 3;
		max_sides = 16;
		sides = min_sides;
		keys = [[NSArray alloc] initWithObjects:@"3", @"4", @"5", @"6", @"7", @"8", nil];
		objects = [[NSArray alloc] initWithObjects:@"Triangle", @"Square", @"Pentagon", @"Hexagon", @"Septagon", @"Octagon", nil];
		names = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
	}
	return self;
}

- (NSString *)label {
	NSString *side_str = nil;
	side_str = [[NSString alloc] initWithFormat:@"%d", sides];
	[side_str autorelease];
	return (sides <= 8) ? [[self names] objectForKey:side_str] : @"Polygon";
}

- (void)increase {
	sides += (sides < max_sides) ? 1 : 0;
}

- (void)decrease {
	sides -= (sides > min_sides) ? 1 : 0;
}

- (void)dealloc {
	[names release];
	[objects release];
	[keys release];
	
	[super dealloc];
}

- (NSArray *)getPolyPoints:(CGRect)boundRect {
	int radius;
	CGFloat pointX, pointY, centerX, centerY;
	double angleDelta, angleIterator;
	NSMutableArray *pointsArray;
	
	pointsArray = [[NSMutableArray alloc] initWithCapacity:sides+1];	
	centerX = boundRect.size.width / 2.0; //width is always smaller in portrait mode
	angleDelta = 360.0 / sides;
	radius = centerX - 10;
	centerY = boundRect.size.height / 2.0;
	for(angleIterator = 0.0; angleIterator < 360.0; angleIterator += angleDelta) {
		pointX = radius * cos(angleIterator * M_PI / 180.0) + centerX;
		pointY = radius * sin(angleIterator * M_PI / 180.0) + centerY;
		[pointsArray addObject: [NSValue valueWithCGPoint : CGPointMake(pointX, pointY)]];
	}
	[pointsArray autorelease];
	return pointsArray;
}


@end
