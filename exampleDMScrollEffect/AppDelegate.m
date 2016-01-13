//
//  AppDelegate.m
//  exampleDMScrollEffect
//
//  Created by apple on 12/01/16.
//  Copyright (c) 2016 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "MFSideMenu.h"
@interface AppDelegate (){
    CGFloat heightStatusNavi;
}

@end
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
@implementation AppDelegate
SideMenuViewController *leftMenuViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSMutableArray  *arrViewController  =   [[NSMutableArray alloc] init];
  NSArray  *arrImages  =   [[NSArray alloc] initWithObjects:@"1.png",@"2.png",@"3.png",@"4.jpg",@"5.jpg", @"6.jpg",@"7.jpg",@"8.jpg",@"9.jpg",@"10.jpg", nil];
    
 self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];

 
  //  NSDictionary *textAttributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:12.0f],
 //             NSForegroundColorAttributeName : [UIColor blackColor]};
    
    
    
    for(int i=0; i<arrImages.count; i++){
        
        ViewController *vc2 = [[ViewController alloc] initWtihBackgroundImage:[UIImage imageNamed:[arrImages objectAtIndex:i]]];
        
//        vc2.pagerObj = [DMPagerNavigationBarItem newItemWithText: [[NSAttributedString alloc] initWithString:@"" attributes:textAttributes]
//                                                         andIcon: [UIImage imageNamed:@"gear"]];
        
        
        vc2.pagerObj    =   [DMPagerNavigationBarItem newItemWithText];
       // vc2.pagerItem.renderingMode = DMPagerNavigationBarItemModeOnlyText;
        
        
         [arrViewController addObject:vc2];
       
        
        // vc2.view.backgroundColor   =   [UIColor colorWithRed:255.0/255.0 green:31.0/255.0 blue:38.0/255.0 alpha:1];
        
       
    }
    
    self.pagerController    =   [[DMPagerViewController alloc] initWithViewControllers:arrViewController];

    UIColor *activeColor = [UIColor colorWithRed:0.000 green:0.235 blue:0.322 alpha:1.000];
    UIColor *inactiveColor = [UIColor colorWithRed:.84 green:.84 blue:.84 alpha:1.0];
    self.pagerController.navigationBar.inactiveItemColor = inactiveColor;
    self.pagerController.navigationBar.activeItemColor = activeColor;
    
    self.window.rootViewController = self.pagerController;
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}
-(void)sideMenuButton{
   // [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
        //[self setupMenuBarButtonItems];
   // }];
    
}
+(void)reloadSideView{
    [leftMenuViewController reloadTableViewManual]; //Side Menu Data Reloading
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
