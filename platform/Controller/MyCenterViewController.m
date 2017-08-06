//
//  MyCenterViewController.m
//  platform
//
//  Created by chliu.brook on 27/06/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "MyCenterViewController.h"
#import "DBManager.h"
@interface MyCenterViewController (){
    BOOL isLogin;
}

@end

@implementation MyCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *registBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, NAV_STATUS_HEIGHT + 20, 200, 44)];
    [registBtn setBackgroundColor:[UIColor redColor]];
    [registBtn bk_whenTapped:^{
       UIStoryboard *loginSB = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        UIViewController *vc = [loginSB instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self.navigationController pushViewController:vc animated:NO];
    }];
    [self.topView addSubview:registBtn];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    DBManager *db = [DBManager getInstance];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
