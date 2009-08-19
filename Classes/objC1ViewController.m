//
//  objC1ViewController.m
//  objC1
//
//  Created by Mukund Rajamannar on 19/08/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "objC1ViewController.h"

@implementation objC1ViewController

@synthesize sides;
@synthesize sidesCount;

- (void)updateLabel {
	NSString *label = nil;
	label = [[NSString alloc] initWithFormat:@"%d",sides];
	[label autorelease];
	sidesCount.text = label;
}

- (void)decrease {
	self.sides -= self.sides > 4 ? 1 : 0;
	[self updateLabel];
}

- (void)increase {
	self.sides += self.sides < 8 ? 1 : 0;
	[self updateLabel];
}

- (id)init {
	if (self = [super init]) {
		self.sides = 4;
	}
	return self;
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	sides = 4;
	[self updateLabel];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}

@end
