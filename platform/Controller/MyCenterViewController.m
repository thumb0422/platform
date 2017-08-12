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

@end

@implementation MyCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
    UILabel *loginLabel = [[UILabel alloc] init];
    [loginLabel setBackgroundColor:[UIColor yellowColor]];
    [loginLabel setTextColor:[UIColor blueColor]];
    [loginLabel setTextAlignment:NSTextAlignmentCenter];
    [loginLabel setText:_isLogin ? _accountInfo.accountName:@"未登录"];
    [loginLabel bk_whenTapped:^{
        UIStoryboard *loginSB = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        UIViewController *vc = [loginSB instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self.navigationController pushViewController:vc animated:NO];
    }];
    [self.topView addSubview:loginLabel];
    [loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.topView.mas_centerX);
        make.width.equalTo(@100);
        make.bottom.equalTo(self.topView.mas_bottom).offset(-30);
        make.height.equalTo(@44);
    }];
    */
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 200, 44)];
    [btn setTitle:_isLogin ? _accountInfo.accountName:@"未登录" forState:UIControlStateNormal];
    [btn bk_whenTapped:^{
        UIViewController *nextVC = SelfSBVC(@"Login", @"LoginViewController");
        [self.navigationController pushViewController:nextVC animated:NO];
    }];
    [self.topView addSubview:btn];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    _account = [self isLogin];
    _accountInfo = [[AccountInfo objectsWhere:@"mobileNo = %@ and isValid = %@",_account.mobileNo,@YES] firstObject];
    _isLogin = _accountInfo.isValid;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

-(Account *)isLogin{
    RLMResults<Account *> *accountInfos = [Account allObjects];
    for (int i = 0;i<accountInfos.count;i++){
        Account *accountTmp = [accountInfos objectAtIndex:i];
        if (accountTmp.isValid){
            return accountTmp;
        }
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
