//
//  TestViewController.h
//  Mando 4G
//
//  Created by alfonso on 08/09/11.
//  Copyright 2011 SIESTA. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TestViewController : UIViewController <UIGestureRecognizerDelegate> {
    UITapGestureRecognizer *tapRecognizer;
    UISwipeGestureRecognizer *swipeLeftRecognizer;
	UISwipeGestureRecognizer *swipeUpRecognizer;
	UISwipeGestureRecognizer *swipeDownRecognizer;

    UIImageView *imageView;
    UISegmentedControl *segmentedControl;
}

@property (nonatomic, retain) UITapGestureRecognizer *tapRecognizer;
@property (nonatomic, retain) UISwipeGestureRecognizer *swipeLeftRecognizer;
@property (nonatomic, retain) UISwipeGestureRecognizer *swipeUpRecognizer;
@property (nonatomic, retain) UISwipeGestureRecognizer *swipeDownRecognizer;


@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)takeLeftSwipeRecognitionEnabledFrom:(UISegmentedControl *)aSegmentedControl;

@end
