//
//  SideMenuViewController.m
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import "SideMenuViewController.h"
#import "MFSideMenu.h"
//#import "splashScreenViewController.h"
//#import "userListViewController.h"
//#import "LoginViewController.h"
//#import "BloodDonateViewController.h"
//#import <Parse/Parse.h>
//#import "loginClassViewController.h"
//#import "articleCategoryViewController.h"
//#import "portadaImageViewController.h"
//#import "userSettingsViewController.h"
//#import "notificationPageViewController.h"
@implementation SideMenuViewController{
    NSMutableArray *countryNameList;
    NSMutableArray *imageNameList;
    NSMutableArray *languageIdArray;
}
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width

#pragma mark -
#pragma mark - UITableViewDataSource
-(void)viewDidAppear:(BOOL)animated
{
     [self.tableView setSeparatorColor:[UIColor blackColor]];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    self.tableView.frame = CGRectMake(self.tableView.frame.origin.x, 22, self.tableView.frame.size.width, self.tableView.frame.size.height);
    self.tableView.tableFooterView = [[UIView alloc] init];

    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgImage"]];
}
-(void)viewWillAppear:(BOOL)animated{
    
}
-(void)viewDidLoad{
   // countryNameList = [[NSMutableArray alloc]initWithObjects:@"DIRECTORY",@"FORTH COMING",@"NEWSLETTER",@"LOGIN / REGISTER",@"SETTING",@"ABOUT",nil];
    //imageNameList = [[NSMutableArray alloc]initWithObjects:@"white_user_icon", @"forth_coming_icon", @"newsletter_icon",@"loginandreg",@"setting_white_icon",@"about_branch_icon",  nil];
    
    
    
//    countryNameList =   [[NSMutableArray alloc] initWithObjects:@"LOGIN / REGISTER", @"SETTING", @"BLOOD GROUP", nil];
    countryNameList =   [[NSMutableArray alloc] initWithObjects:@"LOGIN / REGISTER", @"SETTINGS", @"BLOOD DONATION", @"SUGGESTION",@"ORGAN DONATION", @"GROUP CHAT",@"UPDATE DATABASE",nil];

//    imageNameList   =   [[NSMutableArray alloc] initWithObjects:@"loginandreg", @"setting_white_icon",@"blood-group-icon", nil];
    
    // imageNameList   =   [[NSMutableArray alloc] initWithObjects:@"login_register", @"setting_icon_5",  @"blood_icon_50", @"suggestion_icon_50", @"organ_icon_50",@"nexusae0_FloatingNotifications-Thumb",@"database-up-icon-hi",nil];
    
    
//    NSString *userStatus =     [[NSUserDefaults standardUserDefaults] valueForKey:@"userLogin"];
//    
//    if ([userStatus isEqualToString:@"yes"]) {
////        NSMutableDictionary *userDataDic = [[NSUserDefaults standardUserDefaults] valueForKey:@"userDetails"];
//        [countryNameList replaceObjectAtIndex:3 withObject:@"Logout"];
//        [imageNameList replaceObjectAtIndex:3 withObject:@"logoout"];
//    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return countryNameList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [countryNameList objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIImage *upcommingImage = [UIImage imageNamed:[imageNameList objectAtIndex:indexPath.row]];
  //  NSString *userStatus =     [[NSUserDefaults standardUserDefaults] valueForKey:@"userLogin"];
   // if ([userStatus isEqualToString:@"yes"] && indexPath.row == 3)
//    if ([userStatus isEqualToString:@"yes"] && indexPath.row == 0) {
//        //        NSMutableDictionary *userDataDic = [[NSUserDefaults standardUserDefaults] valueForKey:@"userDetails"];
//        cell.textLabel.text = @"LOGOUT";
//        upcommingImage  = [UIImage imageNamed:@"logout_icon-1"];
//    }

    
    
    float oldWidth = upcommingImage.size.width;
    float scaleFactor = 25 / oldWidth;
    
    float newHeight = upcommingImage.size.height * scaleFactor;
    float newWidth = oldWidth * scaleFactor;

    
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(newWidth, newHeight), NO, 0.0);
    [upcommingImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    

    cell.imageView.image = newImage;
//    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
    return cell;
}
-(void)reloadTableViewManual : (SideMenuViewController *)delegate{
    [delegate.tableView reloadData];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return SCREEN_HEIGHT/12;
    return 0;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, SCREEN_HEIGHT/12 )];
     [headerView setBackgroundColor:[UIColor  colorWithPatternImage:[UIImage imageNamed:@"navigationBg"]]];
 
    
    
    UILabel *titleLabel = [ [UILabel alloc] initWithFrame:CGRectMake(0, 0, headerView.frame.size.width, headerView.frame.size.height	 )];
    titleLabel.text = @"Jaipur Branch\n(CIRC of ICAI)";
    titleLabel.textColor = [UIColor redColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font =  [UIFont fontWithName:@"Dosis-SemiBold" size:18];
    if (SCREEN_HEIGHT == 960 || SCREEN_HEIGHT == 480) {
        titleLabel.font =  [UIFont fontWithName:@"Dosis-SemiBold" size:14 ];
        
    }

    titleLabel.numberOfLines = 2;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:titleLabel];
    
//    UIImageView *imageObj = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icailogo_trans.png"]];
//    imageObj.frame = CGRectMake(SCREEN_WIDTH/32, (SCREEN_HEIGHT/12-SCREEN_HEIGHT/15)/2, SCREEN_HEIGHT/15, SCREEN_HEIGHT/15);
//    [headerView addSubview:imageObj];
    
  /*  UIImageView *profileImageView = [[UIImageView alloc]init];
    profileImageView.frame = CGRectMake(15, 35, 40, 40);
   
    [headerView addSubview:profileImageView];
    
    PFUser *user = [PFUser currentUser];
     PFFile *profilePictureSmall = [user objectForKey:@"user_image"];
    [profilePictureSmall getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:data];
             profileImageView.image = image;
            // image can now be set on a UIImageView
        }
    }];
    
    
    UILabel *titleLabel = [ [UILabel alloc] initWithFrame:CGRectMake(65, 35, 145, 20)];
    titleLabel.text = [user valueForKey:@"User_first_name"];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont systemFontOfSize:12];
    [headerView addSubview:titleLabel];
    
    UILabel *emailLabel = [ [UILabel alloc] initWithFrame:CGRectMake(65, 55, 145, 15)];
    emailLabel.text =[user valueForKey:@"email"];
    emailLabel.textColor = [UIColor blackColor];
    emailLabel.backgroundColor = [UIColor clearColor];
    emailLabel.font = [UIFont systemFontOfSize:12];
    [headerView addSubview:emailLabel];
    
 
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    settingBtn.frame = CGRectMake(215, 40,25, 25);
    [settingBtn setBackgroundImage:[UIImage imageNamed:@"7S.png"] forState:UIControlStateNormal];
    [settingBtn addTarget:self action:@selector(helloViewObj) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:settingBtn];
    
    UILabel *breakLabel = [ [UILabel alloc] initWithFrame:CGRectMake(0, headerView.frame.size.height-40, tableView.frame.size.width, 40)];
    breakLabel.text = @"        Menu";
    breakLabel.textColor = [UIColor whiteColor];
    breakLabel.backgroundColor = [UIColor colorWithRed:(37/255.0f) green:(36/255.0f) blue:(37/255.0f) alpha:1];
    breakLabel.font = [UIFont systemFontOfSize:20];
    [headerView addSubview:breakLabel];
    */
    return headerView;
}

-(void)labelValueChange : (NSString *)dataStr{
    
}
-(void)helloViewObj {
  /*  NSArray *controllers = [[NSArray alloc]init];
    userSettingsViewController *userSettins  = [[userSettingsViewController alloc]initWithNibName:@"userSettingsViewController" bundle:nil];
     userSettins.title = @"Settings";
    controllers = [NSArray arrayWithObject:userSettins];
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    navigationController.viewControllers = controllers;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];*/
}
-(void)reloadTableViewManual  {
    [self.tableView reloadData];
}
#pragma mark -
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}
//    if(indexPath.row==0){
//        
//        NSArray *controllers = [[NSArray alloc]init];
//        NSString *userStatus =     [[NSUserDefaults standardUserDefaults] valueForKey:@"userLogin"];
//        if ([userStatus isEqualToString:@"yes"]) {
//            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userLogin"];
//            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userLoginId"];
//             [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userNameSave"];
//            [[NSUserDefaults standardUserDefaults] synchronize];
//            
//            
//            [AppDelegate reloadSideView]; //SideMenuTableViewRealoding
//            LoginViewController *dashboardCls   =   [[LoginViewController alloc] init];
//           // HomeViewControllerNew *dashboardCls  =   [[HomeViewControllerNew alloc]init ];
//            //            [self.navigationController pushViewController:logIn animated:NO];
//            
//            //
//            //            ProfileViewController *profile   =   [[ProfileViewController alloc]init ];
//            //            profile.pageType = @"update";
//            //            NSMutableDictionary *arrayToPass =    [[NSUserDefaults standardUserDefaults]valueForKey:@"userDetails" ];
//            //            profile.detailArray =   arrayToPass ;
//            
//            controllers = [NSArray arrayWithObject:dashboardCls];
//            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
//            navigationController.viewControllers = controllers;
//            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//            
//            
//        }else{
//            LoginViewController *login = [[LoginViewController alloc]init];
//            
//            controllers = [NSArray arrayWithObject:login];
//            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
//            navigationController.viewControllers = controllers;
//            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//            
//        }
//    }
//    else if(indexPath.row==1){
//        
//        NSArray *controllers = [[NSArray alloc]init];
//        settingsViewController *login  =   [[settingsViewController alloc]init ];
//        
//        controllers = [NSArray arrayWithObject:login];
//        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
//        navigationController.viewControllers = controllers;
//        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//        
//        
//    }
//    else if (indexPath.row == 2) {
//        
//        BloodDonateViewController * birthAnn    =   [[BloodDonateViewController alloc] init];
//        NSArray * controllers   =   [NSArray arrayWithObject:birthAnn];
//        UINavigationController * navigationController   =   self.menuContainerViewController.centerViewController;
//        navigationController.viewControllers    =   controllers;
//        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//        
//    }
//    else if (indexPath.row == 3) {
//        
//        suggestionViewController * birthAnn    =   [[suggestionViewController alloc] init];
//        NSArray * controllers   =   [NSArray arrayWithObject:birthAnn];
//        UINavigationController * navigationController   =   self.menuContainerViewController.centerViewController;
//        navigationController.viewControllers    =   controllers;
//        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//        
//    }
//    else if (indexPath.row == 4) {
//        
//        OrganViewController * birthAnn    =   [[OrganViewController alloc] init];
//        NSArray * controllers   =   [NSArray arrayWithObject:birthAnn];
//        UINavigationController * navigationController   =   self.menuContainerViewController.centerViewController;
//        navigationController.viewControllers    =   controllers;
//        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//        
//    }
//    else if (indexPath.row == 5) {
//        
//        ChatViewController * birthAnn    =   [[ChatViewController alloc] init];
//        NSArray * controllers   =   [NSArray arrayWithObject:birthAnn];
//        UINavigationController * navigationController   =   self.menuContainerViewController.centerViewController;
//        navigationController.viewControllers    =   controllers;
//        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//        
//    }
//    else if (indexPath.row == 6) {
//        
//        updateLocalDataViewController * birthAnn    =   [[updateLocalDataViewController alloc] init];
//        NSArray * controllers   =   [NSArray arrayWithObject:birthAnn];
//        UINavigationController * navigationController   =   self.menuContainerViewController.centerViewController;
//        navigationController.viewControllers    =   controllers;
//        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//        
//    }
//
//    
//}
//    
//
//    
//    
//    
//    if (indexPath.row==0) {
//        NSArray *controllers = [[NSArray alloc]init];
//        userListViewController *articleView; articleView = [[userListViewController alloc]init ];
//        articleView.is_sideMenu = @"yes";
//        
//        controllers = [NSArray arrayWithObject:articleView];
//        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
//        navigationController.viewControllers = controllers;
//        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//
//    }else  if (indexPath.row==1) {
//        
//        
//        
//        NSArray *controllers = [[NSArray alloc]init];
//  
//    
//        managementCommiteeViewController  *manegementObj  =   [[managementCommiteeViewController  alloc]init ];
//        manegementObj.urlString = @"http://jaipur-icai.org/Sitecontent/pageapp/forthcoming--programs";
//    
//        controllers = [NSArray arrayWithObject:manegementObj];
//        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
//        navigationController.viewControllers = controllers;
//        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//        
//        
//        
//        
//        
//    }else  if (indexPath.row==2) {
//        
//        
//        
//        NSArray *controllers = [[NSArray alloc]init];
//        NewsLetterViewController *login = [[NewsLetterViewController alloc]init];
//        controllers = [NSArray arrayWithObject:login];
//        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
//        navigationController.viewControllers = controllers;
//        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//        
//        
//        
//        
//        
//    }else  if (indexPath.row==3) {
//        
//        
//        
//        NSArray *controllers = [[NSArray alloc]init];
//        NSString *userStatus =     [[NSUserDefaults standardUserDefaults] valueForKey:@"userLogin"];
//        if ([userStatus isEqualToString:@"yes"]) {
//            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userLogin"];
//            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userDetails"];
//            [[NSUserDefaults standardUserDefaults] synchronize];
//           
//            
//            [AppDelegate reloadSideView]; //SideMenuTableViewRealoding
//
//            HomeViewControllerNew *dashboardCls  =   [[HomeViewControllerNew alloc]init ];
////            [self.navigationController pushViewController:logIn animated:NO];
//
////            
////            ProfileViewController *profile   =   [[ProfileViewController alloc]init ];
////            profile.pageType = @"update";
////            NSMutableDictionary *arrayToPass =    [[NSUserDefaults standardUserDefaults]valueForKey:@"userDetails" ];
////            profile.detailArray =   arrayToPass ;
//            
//            controllers = [NSArray arrayWithObject:dashboardCls];
//            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
//            navigationController.viewControllers = controllers;
//            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//            
//            
//        }else{
//            LoginViewController *login = [[LoginViewController alloc]init];
//            
//            controllers = [NSArray arrayWithObject:login];
//            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
//            navigationController.viewControllers = controllers;
//            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//            
//        }
//        
//        
//        
//        
//        
//    }else  if (indexPath.row==4) {
//        
//        
//        
//        NSArray *controllers = [[NSArray alloc]init];
//        settingsViewController *login  =   [[settingsViewController alloc]init ];
//        
//        controllers = [NSArray arrayWithObject:login];
//        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
//        navigationController.viewControllers = controllers;
//        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//        
//        
//        
//        
//        
//    }else  if (indexPath.row==5) {
//        
//        
//        
//        NSArray *controllers = [[NSArray alloc]init];
//        
//        
//        managementCommiteeViewController  *manegementObj  =   [[managementCommiteeViewController  alloc]init ];
//        manegementObj.urlString = @"http://jaipur-icai.org/home/homeapp";
//        
//        controllers = [NSArray arrayWithObject:manegementObj];
//        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
//        navigationController.viewControllers = controllers;
//        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//        
//        
//        
//        
//    }
//
//    
    
   /* if (indexPath.row == 10) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/telediaspora.net"]];
    }else if (indexPath.row == 11) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/panafricaincom"]];

    }else if (indexPath.row == 12) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.youtube.com/user/telediaspora"]];

    }else{
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setValue:[NSString stringWithFormat:@"%@",[languageIdArray objectAtIndex:indexPath.row]] forKey:@"languageId"];
        [userDefaults setValue:@"yes" forKey:@"newReload"];
        [userDefaults setValue:@"yes"  forKey:@"videoReload"];
        [userDefaults setValue:@"yes"  forKey:@"depecheReload"];
        [userDefaults setValue:@"yes"  forKey:@"topDeReload"];
        [userDefaults setValue:@"yes" forKey:@"ducumentReload"];
        
        [userDefaults synchronize];
        AppDelegate *appObj =  (AppDelegate *)[[UIApplication sharedApplication] delegate]  ;
        [appObj appDelegateFunction];
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    }
    */
//}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
  /*  if (buttonIndex==1) {
        [PFUser logOut];
        [[GPPSignIn sharedInstance] signOut];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"loginwithgoogle"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSArray *controllers = [[NSArray alloc]init];
        loginClassViewController *articleView;
        if (IS_IPHONE) {
            NSLog(@"iphone h ");
            articleView = [[loginClassViewController alloc]initWithNibName:@"loginClassViewController" bundle:nil];
        }else{
            articleView = [[loginClassViewController alloc]initWithNibName:@"loginClassViewController_iPad" bundle:nil];
        }
        articleView.title = @"Favoritos";
        controllers = [NSArray arrayWithObject:articleView];
        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
        navigationController.viewControllers = controllers;
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"push_notification"] ;
        [[NSUserDefaults standardUserDefaults] synchronize];
    }*/
}

 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return SCREEN_HEIGHT/12;;
   
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navigationBg"]];//[UIColor colorWithRed:(19/255.f) green:(46/255.f) blue:(70/255.f) alpha:1];
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
@end
