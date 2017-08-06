//
//  AppDelegate.m
//  platform
//
//  Created by chliu.brook on 26/06/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    BaseNavController *homeNav     = [[BaseNavController alloc] initWithRootViewController:SelfSBVC(@"Main", @"HomeViewController")];
    BaseNavController *purchaseNav = [[BaseNavController alloc] initWithRootViewController:SelfSBVC(@"Main", @"PurchaseViewController")];
    BaseNavController *companyNav  = [[BaseNavController alloc] initWithRootViewController:SelfSBVC(@"Main", @"CompanyInfoViewController")];
    BaseNavController *myCenterNav = [[BaseNavController alloc] initWithRootViewController:SelfSBVC(@"Main", @"MyCenterViewController")];
    
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    tabVC.viewControllers = @[homeNav,purchaseNav,companyNav,myCenterNav];
    [self setTabBarItems:tabVC];
    self.window.rootViewController = tabVC;
    [self setNavBarAppearence];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)setTabBarItems:(UITabBarController*)tabBarVC
{
    NSArray *titles = @[@"首页", @"购买", @"公司介绍",@"我的"];
//    NSArray *normalImages = @[@"mine", @"mine", @"mine"];
//    NSArray *highlightImages = @[@"mineHighlight", @"mineHighlight", @"mineHighlight"];
    [tabBarVC.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.title = titles[idx];
//        obj.image = [[UIImage imageNamed:normalImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        obj.selectedImage = [[UIImage imageNamed:highlightImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }];
}

- (void)setNavBarAppearence
{
    UIColor *MainNavBarColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    // 设置导航栏默认的背景颜色
    [UIColor wr_setDefaultNavBarBarTintColor:MainNavBarColor];
    // 设置导航栏所有按钮的默认颜色
    [UIColor wr_setDefaultNavBarTintColor:[UIColor whiteColor]];
    // 设置导航栏标题默认颜色
    [UIColor wr_setDefaultNavBarTitleColor:[UIColor whiteColor]];
    // 统一设置状态栏样式
    [UIColor wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
//     [UIColor wr_setDefaultNavBarShadowImageHidden:YES];
}

@end
