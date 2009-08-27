//
//  objC1ViewController.h
//  objC1
//
//  Created by Mukund Rajamannar on 19/08/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolyView.h"

@interface objC1ViewController : UIViewController {
	IBOutlet PolyView *polyView;
}

@property (nonatomic, retain) PolyView *polyView;

- (void)saveState;

@end

