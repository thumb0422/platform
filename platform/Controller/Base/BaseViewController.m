//
//  BaseViewController.m
//  platform
//
//  Created by chliu.brook on 05/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
}

- (void)initNav{
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarClick)];
    self.navigationItem.leftBarButtonItem = leftBar;
}

- (void)leftBarClick{
    if (self.navigationController.viewControllers.count > 0){
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
