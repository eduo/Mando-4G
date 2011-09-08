//
//  TestViewAppDelegate.h
//  Mando 4G
//
//  Created by alfonso on 08/09/11.
//  Copyright 2011 SIESTA. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestViewController;

@interface TestViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TestViewController *viewController;
@end
