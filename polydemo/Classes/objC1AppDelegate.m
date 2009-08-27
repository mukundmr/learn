//
//  objC1AppDelegate.m
//  objC1
//
//  Created by Mukund Rajamannar on 19/08/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "objC1AppDelegate.h"
#import "objC1ViewController.h"

@implementation objC1AppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	//time to save state
	[viewController saveState];
}



- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
