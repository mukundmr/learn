//
//  objC1ViewController.h
//  objC1
//
//  Created by Mukund Rajamannar on 19/08/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface objC1ViewController : UIViewController {
	int sides;
	IBOutlet UILabel *sidesCount;
}

@property int sides;
@property (nonatomic, retain) UILabel *sidesCount; 

- (void)updateLabel;

@end

