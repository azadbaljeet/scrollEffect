//
//  AppDelegate.h
//  exampleDMScrollEffect
//
//  Created by apple on 12/01/16.
//  Copyright (c) 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DMPagerViewController/DMPagerNavigationBar.h>
#import "ViewController.h"
#import "SideMenuViewController.h"
#import "MFSideMenuContainerViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
/*
 @interface DMAppDelegate : UIResponder <UIApplicationDelegate>
 
 @property (strong, nonatomic) UIWindow *window;
 @property (strong, nonatomic) DMPagerViewController	*pagerController;
 
 */
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) DMPagerViewController	*pagerController;
+(void)reloadSideView;
@end

