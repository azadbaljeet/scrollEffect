//
//  ViewController.h
//  exampleDMScrollEffect
//
//  Created by apple on 12/01/16.
//  Copyright (c) 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMPagerViewController.h"

@class DMPagerNavigationBarItem;
@interface ViewController : UIViewController<DMPagerViewControllerProtocol>
@property (nonatomic,strong) DMPagerNavigationBarItem	*pagerObj;
-(instancetype)initWithText:(NSString *) aText backgroundColor:(UIColor *) aBkgColor;
- (instancetype)initWtihBackgroundImage:(UIImage *) img;

@end

