//
//  ShoppingCartViewController.m
//  platform
//
//  Created by chliu.brook on 20/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "ShoppingCartViewController.h"

@interface ShoppingCartViewController ()

@property (nonatomic,strong) UITableView *tv;
@property (nonatomic,strong) UIView *bottomView;
@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
