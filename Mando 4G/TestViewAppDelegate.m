//
//  TestViewAppDelegate.m
//  Mando 4G
//
//  Created by alfonso on 08/09/11.
//  Copyright 2011 SIESTA. All rights reserved.
//

#import "TestViewAppDelegate.h"


#import "TestViewAppDelegate.h"
#import "TestViewController.h"

@implementation TestViewAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Display the view controller's view in the application's window. 
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end