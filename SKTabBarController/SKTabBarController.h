//
//  SKViewController.h
//  SKTabBarController
//
//  Created by Soroush Khanlou on 11/13/12.
//  Copyright (c) 2012 Soroush Khanlou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKTabBarController : UIViewController <UITabBarDelegate>

@property (nonatomic, retain) NSArray *viewControllers;
@property (nonatomic, retain) UITabBar *tabBar;
@property (nonatomic, retain) UIViewController *selectedViewController;
@property (nonatomic, assign) NSInteger *selectedIndex;

@end
