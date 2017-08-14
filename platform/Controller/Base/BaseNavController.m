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
    self.navigationBar.shadowImage = [UIImage new];//隐藏导航条下的一条线
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
