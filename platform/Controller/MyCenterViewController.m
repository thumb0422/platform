//
//  MyCenterViewController.m
//  platform
//
//  Created by chliu.brook on 27/06/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "MyCenterViewController.h"
#import "AccountInfo.h"
@interface MyCenterViewController (){
    BOOL _isLogin;
    Account *_account;
    AccountInfo *_accountInfo;
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
    _account = [[Account allObjects] firstObject];
    _isLogin = false;
    if (_account != nil){
        _accountInfo = [[AccountInfo objectsWhere:@"mobileNo = %@ and isValid = %@",_account.mobileNo,@YES] firstObject];
        _isLogin = _accountInfo.isValid;
    }
    
    [self.topRegistBtn setTitle:_isLogin ? [NSString stringWithFormat:@"%@已登录",_accountInfo.accountName]:@"未登录" forState:UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
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
