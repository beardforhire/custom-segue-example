//
//  ExplodeSegue.m
//  CustomSegueExample
//
//  Created by Shaun Lewis on 2/1/15.
//  Copyright (c) 2015 Shaun Lewis. All rights reserved.
//

#import "ExplodeSegue.h"

@implementation ExplodeSegue

- (void)perform {
	UIViewController *currentViewController = self.sourceViewController;
	UIViewController *destinationViewController = self.destinationViewController;
	
	// Grab a reference to the current view from View Controller #1 so we can animate properties on it separately (and independent of its parent)
	UIView *currentView = currentViewController.view;
	
	// Create a blank container view and replace the view on View Controller #1 with it. This container will contain the destination view and the current view
	currentViewController.view = [[UIView alloc] initWithFrame:currentView.frame];
	
	// Add the destination view and the place the current view on top of it so the destination view is hidden (Note: this won't work if the current view is transparent)
	[currentViewController.view addSubview:destinationViewController.view];
	[currentViewController.view addSubview:currentView];
	
	// Animate the properties we want to change. We want to wind up with the destination view visible, so we have to either fade out the source view (boring) or make it appear to grow in size and fade out (less boring)
	[UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
		// Note: We aren't touching the destination view, we are only animating the current view out of the way
		currentView.transform = CGAffineTransformMakeScale(3.0, 3.0); // This scales the view
		currentView.alpha = 0.0; // Make it invisible
		
		// Animate other properites here if you wish or change the ones above. Whatever you want!!!
		
	} completion:^(BOOL finished) {
		// We have to dispatch instead of calling this method directly because there will be unbalanced calls for begin/end transition because this transition could possibly be unfinished
		dispatch_async(dispatch_get_main_queue(), ^(void) {
			// This is where the actual pushing of the destination view controller onto the proverbial stack occurs
			[currentViewController presentViewController:destinationViewController animated:NO completion:^{
				// Reset the view hierarchy to the original for unwinding (technically optional, but you should do it)
				
				// 1. Put the view controller back on the stack
				currentViewController.view = currentView;
				
				// 2. Reset the animated properties back to their defaults
				currentView.alpha = 1.0;
				currentView.transform = CGAffineTransformIdentity;
			}];
		});
	}];
}

@end
