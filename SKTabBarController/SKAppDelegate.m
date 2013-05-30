//
//  SKAppDelegate.m
//  SKTabBarController
//
//  Created by Soroush Khanlou on 11/13/12.
//  Copyright (c) 2012 Soroush Khanlou. All rights reserved.
//

#import "SKAppDelegate.h"

#import "SKTabBarController.h"
#import "SKViewController.h"

@implementation SKAppDelegate

@synthesize tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	// Override point for customization after application launch.
	self.tabBarController = [[SKTabBarController alloc] init];
	
	SKViewController *firstViewController = [[SKViewController alloc] init];
	firstViewController.view.backgroundColor = [UIColor blueColor];
	
	UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
	firstViewController.tabBarItem = firstItem;
	
	SKViewController *secondViewController = [[SKViewController alloc] init];
	secondViewController.view.backgroundColor = [UIColor redColor];
	
	UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
	secondViewController.tabBarItem = secondItem;

	tabBarController.viewControllers = @[firstViewController, secondViewController];
	
	self.window.rootViewController = self.tabBarController;
	[self.window makeKeyAndVisible];
	return YES;
}


@end
