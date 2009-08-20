//
//  objC1ViewController.h
//  objC1
//
//  Created by Mukund Rajamannar on 19/08/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Poly.h"

@interface objC1ViewController : UIViewController {
	IBOutlet UILabel *sidesCount;
	Poly *aPoly;
}

@property (nonatomic, retain) UILabel *sidesCount; 

- (void)updateLabel;
- (void)increase;
- (void)decrease;

@end

