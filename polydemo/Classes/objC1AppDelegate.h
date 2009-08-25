//
//  objC1AppDelegate.h
//  objC1
//
//  Created by Mukund Rajamannar on 19/08/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class objC1ViewController;

@interface objC1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    objC1ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet objC1ViewController *viewController;

@end

