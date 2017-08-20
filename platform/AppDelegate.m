//
//  AppDelegate.m
//  platform
//
//  Created by chliu.brook on 26/06/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavController.h"
#import "MigrationDB.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    BaseNavController *homeNav     = [[BaseNavController alloc] initWithRootViewController:SelfSBVC(@"Main", @"HomeViewController")];
    BaseNavController *categoryNav = [[BaseNavController alloc] initWithRootViewController:[[NSClassFromString(@"CategoryViewController") alloc] init]];
    BaseNavController *purchaseNav = [[BaseNavController alloc] initWithRootViewController:[[NSClassFromString(@"ShoppingCartViewController") alloc] init]];
    BaseNavController *myCenterNav = [[BaseNavController alloc] initWithRootViewController:SelfSBVC(@"Main", @"MyCenterViewController")];
    
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    tabVC.viewControllers = @[homeNav,categoryNav,purchaseNav/*,companyNav*/,myCenterNav];
    [self setTabBarItems:tabVC];
    self.window.rootViewController = tabVC;
    [self setNavBarAppearence];
    
    //设置默认Realm 与 数据迁移
    [MigrationDB migrationRealm];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

- (void)setTabBarItems:(UITabBarController*)tabBarVC
{
    NSArray *titles = @[@"首页", @"分类", @"购物车",@"我的"];
    NSArray *normalImages = @[@"home_normal", @"company_normal",@"purchase_normal", @"my_normal"];
    NSArray *highlightImages = @[@"home_selected", @"company_selected",@"purchase_selected", @"my_selected"];
    [tabBarVC.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.title = titles[idx];
        NSLog(@"img = %@",[UIImage imageNamed:normalImages[idx]]);
        obj.image = [[UIImage imageNamed:normalImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        obj.selectedImage = [[UIImage imageNamed:highlightImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }];
}

- (void)setNavBarAppearence
{
    /*
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
     [UIColor wr_setDefaultNavBarShadowImageHidden:YES];
    */
    
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1]];
//    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
//                                                           [UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:21], NSFontAttributeName, nil]];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

@end
