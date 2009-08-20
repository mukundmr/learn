//
//  Poly.h
//  objC1
//
//  Created by Mukund R on 19/08/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Poly : NSObject {
	int sides, min_sides, max_sides;
	NSDictionary *names;
	NSArray *keys, *objects;
}

@property int sides;
@property (readonly) NSDictionary* names;

- (void)increase;
- (void)decrease;
- (NSString *)label;

@end
