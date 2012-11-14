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

@synthesize selectedIndex, selectedViewController, tabBar, viewControllers;


- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	tabBar = [[UITabBar alloc] init];
	tabBar.delegate = self;
	[tabBar sizeToFit];
	[self.view addSubview:tabBar];
	

	tabBar.frame = CGRectMake(0,
						 self.view.frame.size.height - self.tabBar.frame.size.height,
						 self.view.frame.size.width,
						 self.tabBar.frame.size.height);
	
	tabBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
		
	self.viewControllers = viewControllers;
}

- (void) setViewControllers:(NSArray *)newViewControllers {
	viewControllers = newViewControllers;
	NSMutableArray *tabBarItems = [NSMutableArray arrayWithCapacity:viewControllers.count];
	for (NSInteger index = 0; index < viewControllers.count; index++) {
		UIViewController *viewController = viewControllers[index];
		[tabBarItems addObject:viewController.tabBarItem];
	}
	self.tabBar.items = tabBarItems;
	
	self.tabBar.selectedItem = tabBarItems[0];
	[tabBar.delegate tabBar:tabBar didSelectItem:tabBarItems[0]];
}

- (void) tabBar:(UITabBar *)aTabBar didSelectItem:(UITabBarItem *)item {
	NSInteger index = [tabBar.items indexOfObject:item];
	UIViewController *vc = viewControllers[index];
	if (vc != nil && self.selectedViewController == vc) {
		if ([vc isKindOfClass:[UINavigationController class]]) {
			[((UINavigationController*)vc) popToRootViewControllerAnimated:YES];
		}
		return;
	}
	
	[selectedViewController willMoveToParentViewController:nil];
	//this automatically calls view did/will disappear
	[selectedViewController.view removeFromSuperview];
	
	//use this as the counterpart to addChildViewController:
	[selectedViewController removeFromParentViewController];
	
	vc = viewControllers[index];
	
	vc.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - self.tabBar.bounds.size.height);
	
	
	// willMoveToParentViewController: is not strictly necessary, unless you're overriding addChildViewController:
	[vc willMoveToParentViewController:self];
	
	//must be called before addSubview:
	[self addChildViewController:vc];
	
	//this automatically calls view did/will appear
	[self.view addSubview:vc.view];
	
	//this is necessary, unlike willMove
	[vc didMoveToParentViewController:self];
	
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
