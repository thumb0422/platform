//
//  RegistViewController.m
//  platform
//
//  Created by chliu.brook on 06/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "RegistViewController.h"
#import "AccountInfo.h"
@interface RegistViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNo;
@property (weak, nonatomic) IBOutlet UITextField *verfiNo;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIButton *registBtn;

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册帐号";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registClick:(id)sender {
    //先查看有没有该帐号
    RLMResults<AccountInfo *> *accountInfos = [AccountInfo objectsWhere:@"mobileNo = %@",self.phoneNo.text];
    if (accountInfos.count < 1){
        AccountInfo *accountInfo = [[AccountInfo alloc] init];
        accountInfo.accountName = self.phoneNo.text;
        accountInfo.mobileNo = self.phoneNo.text;
        accountInfo.accountPWD = self.pwd.text;
        accountInfo.isValid = @YES;
        
        RLMResults<Account*> *accounts = [Account allObjects];
        Account * addAccount = [[Account alloc] initWithValue:@{@"mobileNo":accountInfo.mobileNo}];
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:accounts];
        [realm addObject:addAccount];
        
        [realm addObject:accountInfo];
        [realm commitWriteTransaction];
        
        UserModel *model = [[UserModel alloc] init];
        model.accountName = self.phoneNo.text;
        model.mobileNo = self.phoneNo.text;
        model.isLogin = YES;
        [UserManager getInstance].userModel = model;
        
        //弹窗提示 注册
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        alert.shouldDismissOnTapOutside = YES;
        [alert alertIsDismissed:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        }];
        [alert showInfo:self title:@"" subTitle:@"注册成功" closeButtonTitle:@"注册成功" duration:0.0f];
    }else {
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        alert.shouldDismissOnTapOutside = YES;
        [alert alertIsDismissed:^{
            UIViewController *nextVc = SelfSBVC(@"Login", @"ResetPWDViewController");
            [self.navigationController pushViewController:nextVc animated:YES];
        }];
        [alert showInfo:self title:@"该帐号已注册" subTitle:@"该帐号已注册，是否重置密码" closeButtonTitle:@"重置密码" duration:0.0f];
    }
}

@end
