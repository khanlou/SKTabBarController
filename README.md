# SKTabBarController

`SKTabBarController` is a very, very basic clone of `UITabBarController`, that uses `UIViewController` containment for appearance management (`viewDidAppear:`, etc) and rotation management (willRotateToInterfaceOrientation:, etc).

## Things it does correctly

* Adds its child subviews to itself in an internally consistent way using the iOS 5 view controller containment APIs, and all the things you get for free with that, such as:
	* Rotation method forwarding
	* Appearance method forwarding
	* Memory warning forwarding
	* `parentViewController` property being set properly
	* `isMovingFromParentViewController` and company

## Things it does not do correctly

* Editable tab bars
* More than two tab bar items (possibly: it hasn't been tested, but it should work)
* Many other behaviors you might expect from a real tab bar controller.

## Other notes

`SKTabBarController` is written with ARC.

It is SO not ready for production.