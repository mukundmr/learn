//
//  Poly.m
//  objC1
//
//  Created by Mukund R on 19/08/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Poly.h"


@implementation Poly

@synthesize sides;
@synthesize names;

- (id) init {
	if (self = [super init]) {
		min_sides = 4;
		max_sides = 8;
		sides = min_sides;
		keys = [[NSArray alloc] initWithObjects:@"4", @"5", @"6", @"7", @"8", nil];
		objects = [[NSArray alloc] initWithObjects:@"Square", @"Pentagon", @"Hexagon", @"Septagon", @"Octagon", nil];
		names = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
	}
	return self;
}

- (NSString *)label {
	NSString *side_str = nil;
	side_str = [[NSString alloc] initWithFormat:@"%d", sides];
	[side_str autorelease];
	return [[self names] objectForKey:side_str];
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


@end
