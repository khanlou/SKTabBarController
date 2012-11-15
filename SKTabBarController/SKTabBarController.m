//
//  SKViewController.m
//  SKTabBarController
//
//  Created by Soroush Khanlou on 11/13/12.
//  Copyright (c) 2012 Soroush Khanlou. All rights reserved.
//

#import "SKTabBarController.h"

@interface SKTabBarController ()

@end

@implementation SKTabBarController

@synthesize selectedIndex, selectedViewController, tabBar;


- (void)viewDidLoad {
	[super viewDidLoad];
		
	tabBar = [[UITabBar alloc] init];
	tabBar.delegate = self;
	[tabBar sizeToFit];
	[self.view addSubview:tabBar];

	tabBar.frame = CGRectMake(0,
						 self.view.frame.size.height - self.tabBar.frame.size.height,
						 self.view.frame.size.width,
						 self.tabBar.frame.size.height);
	
	tabBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
	
	self.viewControllers = self.viewControllers;
}

- (void) setViewControllers:(NSArray *)newViewControllers {
	for (UIViewController *viewController in self.childViewControllers) {
		[viewController willMoveToParentViewController:nil];
		[viewController removeFromParentViewController];
		
		//calling didMoveToParentViewController:nil: is unnecessary here, as removeFromParentViewController: will call it for you, and you will get double callbacks
//		[viewController didMoveToParentViewController:nil];
	}

	NSMutableArray *tabBarItems = [NSMutableArray arrayWithCapacity:newViewControllers.count];
	for (UIViewController *viewController in newViewControllers) {
		[tabBarItems addObject:viewController.tabBarItem];

		//calling willMoveToParentViewController: is unnecessary here, as addChildViewController: will call it for you, and you will get double callbacks
//		[viewController willMoveToParentViewController:self];
		
		[self addChildViewController:viewController];
		[viewController didMoveToParentViewController:self];
	}
	self.tabBar.items = tabBarItems;
	
	self.tabBar.selectedItem = tabBarItems[0];
	[tabBar.delegate tabBar:tabBar didSelectItem:tabBarItems[0]];
}

- (NSArray*) viewControllers {
	return self.childViewControllers;
}

- (void) tabBar:(UITabBar *)aTabBar didSelectItem:(UITabBarItem *)item {
	NSInteger index = [tabBar.items indexOfObject:item];
	UIViewController *vc = self.childViewControllers[index];
	
	//default behavior is to pop to root if you're tapping the button that's already selected
	if (self.selectedViewController == vc) {
		if ([vc isKindOfClass:[UINavigationController class]]) {
			[((UINavigationController*)vc) popToRootViewControllerAnimated:YES];
		}
		return;
	}
	
	//this automatically calls view did/will disappear
	[selectedViewController.view removeFromSuperview];
	
	
	vc.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - self.tabBar.bounds.size.height);
	
	//this automatically calls view did/will appear
	[self.view addSubview:vc.view];
	
	selectedViewController = vc;
}

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	NSLog(@"parent will rotate");
}

// // these return YES by default
//- (BOOL) shouldAutomaticallyForwardAppearanceMethods {
//	return NO;
//}
//
//- (BOOL) shouldAutomaticallyForwardRotationMethods {
//	return NO;
//}

@end
