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
	IBOutlet UISlider *sidesSlider;
	IBOutlet UISwitch *lineStyleSwitch;
	Poly *aPoly;
}

@property (nonatomic, retain) UILabel *sidesCount; 
@property (nonatomic, retain) UILabel *shapeLabel;
@property (nonatomic, retain) UISlider *sidesSlider;
@property (nonatomic, retain) UISwitch *lineStyleSwitch;

- (void)increase;
- (void)decrease;
- (void)setDefaultValues;
// state saver
- (void)saveState;
// control actions
- (void)sliderUsed;
- (void)switchUsed;


@end
