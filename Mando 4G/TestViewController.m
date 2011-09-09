    //
//  TestViewController.m
//  Mando 4G
//
//  Created by alfonso on 08/09/11.
//  Copyright 2011 SIESTA. All rights reserved.
//

#import "TestViewController.h"
#import "Mando4GFunc.h"

@implementation TestViewController

@synthesize swipeLeftRecognizer, swipeUpRecognizer, swipeDownRecognizer, tapRecognizer, imageView, segmentedControl;


#pragma mark -
#pragma mark View lifecycle



// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
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
	
	/*
     Create and configure the four recognizers. Add each to the view as a gesture recognizer.
     */
    UIGestureRecognizer *recognizer;
    
    /*
     Create a tap recognizer and add it to the view.
     Keep a reference to the recognizer to test in gestureRecognizer:shouldReceiveTouch:.
     */
    recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    [self.view addGestureRecognizer:recognizer];
    self.tapRecognizer = (UITapGestureRecognizer *)recognizer;
    recognizer.delegate = self;
    [recognizer release];
	
    /*
     Create a swipe gesture recognizer to recognize right swipes (the default).
     We're only interested in receiving messages from this recognizer, and the view will take ownership of it, so we don't need to keep a reference to it.
     */
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [self.view addGestureRecognizer:recognizer];
    [recognizer release];
    
    /*
     Create a swipe gesture recognizer to recognize left swipes.
     Keep a reference to the recognizer so that it can be added to and removed from the view in takeLeftSwipeRecognitionEnabledFrom:.
     Add the recognizer to the view if the segmented control shows that left swipe recognition is allowed.
     */
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    self.swipeLeftRecognizer = (UISwipeGestureRecognizer *)recognizer;
    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    
    if ([segmentedControl selectedSegmentIndex] == 0) {
        [self.view addGestureRecognizer:swipeLeftRecognizer];
    }
    self.swipeLeftRecognizer = (UISwipeGestureRecognizer *)recognizer;
    [recognizer release];
	
	/* Up swipes */
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    self.swipeUpRecognizer = (UISwipeGestureRecognizer *)recognizer;
    swipeUpRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    
    if ([segmentedControl selectedSegmentIndex] == 0) {
        [self.view addGestureRecognizer:swipeUpRecognizer];
    }
    self.swipeUpRecognizer = (UISwipeGestureRecognizer *)recognizer;
    [recognizer release];
	
	/* Down swipes */
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    self.swipeDownRecognizer = (UISwipeGestureRecognizer *)recognizer;
    swipeDownRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    
    if ([segmentedControl selectedSegmentIndex] == 0) {
        [self.view addGestureRecognizer:swipeDownRecognizer];
    }
    self.swipeDownRecognizer = (UISwipeGestureRecognizer *)recognizer;
    [recognizer release];
	
	
    /*
     Create a rotation gesture recognizer.
     We're only interested in receiving messages from this recognizer, and the view will take ownership of it, so we don't need to keep a reference to it.
     */
    recognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotationFrom:)];
    [self.view addGestureRecognizer:recognizer];
    [recognizer release];
    
    // For illustrative purposes, set exclusive touch for the segmented control (see the ReadMe).
    [segmentedControl setExclusiveTouch:YES];
    
    /*
     Create an image view to display the gesture description.
     */
    UIImageView *anImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 75.0)];
    anImageView.contentMode = UIViewContentModeCenter;
    self.imageView = anImageView;
    [anImageView release];
    [self.view addSubview:imageView];
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.segmentedControl = nil;
    self.tapRecognizer = nil;
    self.swipeLeftRecognizer = nil;
    self.imageView = nil;
	
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	
    // Support all orientations.
    return YES;
}


- (IBAction)takeLeftSwipeRecognitionEnabledFrom:(UISegmentedControl *)aSegmentedControl {
	
    /*
     Add or remove the left swipe recogniser to or from the view depending on the selection in the segmented control.
     */
    if ([aSegmentedControl selectedSegmentIndex] == 0) {
        [self.view addGestureRecognizer:swipeLeftRecognizer];
    }
    else {
        [self.view removeGestureRecognizer:swipeLeftRecognizer];
    }
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
	
    // Disallow recognition of tap gestures in the segmented control.
    if ((touch.view == segmentedControl) && (gestureRecognizer == tapRecognizer)) {
        return NO;
    }
    return YES;
}


#pragma mark -
#pragma mark Responding to gestures

- (void)showImageWithText:(NSString *)string atPoint:(CGPoint)centerPoint {
    
    /*
     Set the appropriate image for the image view, move the image view to the given point, then dispay it by setting its alpha to 1.0.
     */
    NSString *imageName = [string stringByAppendingString:@".png"];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.center = centerPoint;
    imageView.alpha = 1.0;  
}

/*
 In response to a tap gesture, show the image view appropriately then make it fade out in place.
 */
- (void)handleTapFrom:(UITapGestureRecognizer *)recognizer {
    
    CGPoint location = [recognizer locationInView:self.view];
    [self showImageWithText:@"icon_pantalla" atPoint:location];
    
	// Depending on location, mute audio
	// resolution in project not retina display
	if (location.x>120 && location.x<200 && location.y>4 && location.y<40) {
		sendCommand(CMD_MUTE);
	}
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    imageView.alpha = 0.0;
    [UIView commitAnimations];
}

/*
 In response to a swipe gesture, show the image view appropriately then move the image view in the direction of the swipe as it fades out.
 */
- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
	
    CGPoint location = [recognizer locationInView:self.view];
	
	// Action definition according to gesture start location
	
	
    [self showImageWithText:@"icon_tv" atPoint:location];
    
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        location.x -= 220.0;
		sendCommand(CMD_DOWN);

    }
    else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight){
        location.x += 220.0;
    	sendCommand(CMD_UP);

	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
        location.y -= 220.0;
    	sendCommand(CMD_VOL_UP);
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
	   location.y += 220.0;
	   sendCommand(CMD_VOL_DOWN);
	}
	
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.55];
    imageView.alpha = 0.0;
    imageView.center = location;
    [UIView commitAnimations];

}

/*
 In response to a rotation gesture, show the image view at the rotation given by the recognizer, then make it fade out in place while rotating back to horizontal.
 */
- (void)handleRotationFrom:(UIRotationGestureRecognizer *)recognizer {
    
    CGPoint location = [recognizer locationInView:self.view];
    
    CGAffineTransform transform = CGAffineTransformMakeRotation([recognizer rotation]);
    imageView.transform = transform;
    [self showImageWithText:@"rotation" atPoint:location];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.65];
    imageView.alpha = 0.0;
    imageView.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    [segmentedControl release];
    [tapRecognizer release];
    [swipeLeftRecognizer release];
    [swipeUpRecognizer release];
	
    [imageView release];
    [super dealloc];
}


@end
