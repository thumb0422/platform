//
//  BaseNavController.m
//  platform
//
//  Created by chliu.brook on 05/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "BaseNavController.h"

@interface BaseNavController ()

@end

@implementation BaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self wr_setNavBarBackgroundAlpha:0];
    [self.navigationBar wr_setBarButtonItemsAlpha:0 hasSystemBackIndicator:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
