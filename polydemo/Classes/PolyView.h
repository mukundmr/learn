//
//  PolyView.h
//  objC1
//
//  Created by Mukund R on 24/08/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Poly.h"


@interface PolyView : UIView {
	IBOutlet UILabel *sidesCount, *shapeLabel;
	Poly *aPoly;
}

@property (nonatomic, retain) UILabel *sidesCount; 
@property (nonatomic, retain) UILabel *shapeLabel;

- (void)increase;
- (void)decrease;
- (void)setDefaultValues;

// don't ask
- (id)initWithFrame:(CGRect)frame;

@end
