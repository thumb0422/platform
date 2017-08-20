//
//  ShoppingCartViewController.m
//  platform
//
//  Created by chliu.brook on 20/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "ShoppingCartViewController.h"

@interface ShoppingCartViewController ()

@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
}

- (void)initNav{
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarClick)];
    self.navigationItem.rightBarButtonItem = rightBar;
}

- (void)rightBarClick {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
