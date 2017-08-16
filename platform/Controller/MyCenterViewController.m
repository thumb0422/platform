//
//  MyCenterViewController.m
//  platform
//
//  Created by chliu.brook on 27/06/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "MyCenterViewController.h"
@interface MyCenterViewController (){
    BOOL _isLogin;
}
@property (nonatomic,strong) UIButton *topRegistBtn;
@end

@implementation MyCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypePlain];
    [btn addTarget:self action:@selector(onRegistClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.topRegistBtn = btn;
    [self.topView addSubview:self.topRegistBtn];
    [self.topRegistBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.topView.mas_centerX);
        make.width.equalTo(@100);
        make.top.equalTo(self.topImgView.mas_bottom).offset(5);
        make.bottom.equalTo(self.topView.mas_bottom).offset(-5);
    }];
}

- (void)onRegistClick:(UIButton *)sender{
    if (_isLogin){
        UIViewController *nextVC = SelfSBVC(@"Login", @"SettingViewController");
        [self.navigationController pushViewController:nextVC animated:NO];
    }else{
        UIViewController *nextVC = SelfSBVC(@"Login", @"LoginViewController");
        [self.navigationController pushViewController:nextVC animated:NO];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    _isLogin = [UserManager getInstance].userModel.isLogin;
    [self.topRegistBtn setTitle:_isLogin ? [NSString stringWithFormat:@"%@已登录",[UserManager getInstance].userModel.mobileNo ]:@"未登录" forState:UIControlStateNormal];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
