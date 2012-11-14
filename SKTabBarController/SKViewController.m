//
//  SKViewController.m
//  SKTabBarController
//
//  Created by Soroush Khanlou on 11/13/12.
//  Copyright (c) 2012 Soroush Khanlou. All rights reserved.
//

#import "SKViewController.h"

@interface SKViewController ()

@end

@implementation SKViewController

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	NSLog(@"%@ will appear", self);
}

- (void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	NSLog(@"%@ did appear", self);
}

- (void) viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	NSLog(@"%@ will disappear", self);
}

- (void) viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	NSLog(@"%@ did disappear", self);
}

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	NSLog(@"child will rotate");
}

- (void) willMoveToParentViewController:(UIViewController *)parent {
	[super willMoveToParentViewController:parent];
	NSLog(@"%@ will move to parent %@", self, parent);
}

- (void) didMoveToParentViewController:(UIViewController *)parent {
	[super didMoveToParentViewController:parent];
	NSLog(@"%@ did move to parent %@", self, parent);
}

@end
