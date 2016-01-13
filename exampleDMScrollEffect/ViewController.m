//
//  ViewController.m
//  exampleDMScrollEffect
//
//  Created by apple on 12/01/16.
//  Copyright (c) 2016 apple. All rights reserved.
//

#import "ViewController.h"
#import "MFSideMenu.h"

@interface ViewController (){
    CGFloat heightStatusNavi;
}

@end
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    self.navigationController.navigationBarHidden   =   NO;
//    self.navigationItem.hidesBackButton = YES;
//    self.view.backgroundColor   =   [UIColor colorWithRed:255.0/255.0 green:31.0/255.0 blue:38.0/255.0 alpha:1];
//    
//    //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed: @"sidemenu"] style:UIBarButtonItemStylePlain target:self action:@selector(sideMenuButton)];
//    
//    self.navigationController.navigationBar.barTintColor    = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navigationBg"]];
//    
//    self.navigationController.navigationBar.tintColor       = [UIColor whiteColor];
//    UIFont *font = [UIFont fontWithName:@"Dosis-Bold" size:22];
//    NSDictionary *textAttributes = @{ NSFontAttributeName: font };
//    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
//    [self.navigationController.navigationBar
//     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
//    
//    // self.navigationItem.titleView = [[navigationTitleView alloc] initWithFrame:CGRectMake(0, 0, 120, 32)];
//    heightStatusNavi= self.navigationController.navigationBar.frame.size.height +self.navigationController.navigationBar.frame.origin.y;
   
    
  
    // Do any additional setup after loading the view, typically from a nib.
}
- (instancetype)initWithText:(NSString *) aText backgroundColor:(UIColor *) aBkgColor {
    self = [super init];
    if (self) {
        self.view = [[UIView alloc] initWithFrame:CGRectZero];
        self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.view.backgroundColor = aBkgColor;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.text = aText;
        label.font = [UIFont boldSystemFontOfSize:40];
        label.numberOfLines = 1;
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.autoresizingMask = (UIViewAutoresizingFlexibleWidth |
                                  UIViewAutoresizingFlexibleTopMargin    |
                                  UIViewAutoresizingFlexibleBottomMargin);
        [self.view addSubview:label];
        
        CGSize bestSize = [label.attributedText boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                                             options:NSStringDrawingTruncatesLastVisibleLine
                                                             context:NULL].size;
        
        
        label.frame = CGRectMake(0,
                                 ((CGRectGetHeight(self.view.frame)-bestSize.height)/2.0f),
                                 CGRectGetWidth(self.view.frame),
                                 bestSize.height);
        
        UIButton  *button   =   [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame    =   CGRectMake(SCREEN_WIDTH*0.02, 0, 50, 40);
        [button addTarget:self action:@selector(sideMenuButton) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor  =   [UIColor redColor];
        [button setTitle:@"Side" forState:UIControlStateNormal];
        [self.view addSubview:button];

        
    }
    return self;
}
- (instancetype)initWtihBackgroundImage:(UIImage *) img{
    self = [super init];
    if (self) {
     
        self.view.backgroundColor   =   [UIColor greenColor];
       UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        [[[UIApplication sharedApplication] delegate].window addSubview:view1];
        view1.backgroundColor  =   [UIColor yellowColor];
    
        self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
 
        [self.view addSubview:view1];
        UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/2)];
        [backgroundImage setImage:img];
        [view1 addSubview:backgroundImage];
        

    }
    return self;
}
-(void)sideMenuButton{
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
        //[self setupMenuBarButtonItems];
    }];
    
}

- (DMPagerNavigationBarItem *)pagerItem {
    return self.pagerObj;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
