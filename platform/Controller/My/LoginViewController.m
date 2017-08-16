//
//  LoginViewController.m
//  platform
//
//  Created by chliu.brook on 01/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "LoginViewController.h"
#import "AccountInfo.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountNo;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    // Do any additional setup after loading the view.
}

- (IBAction)loginClick:(id)sender {
    //检查是否存在该帐号
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"mobileNo = %@",self.accountNo.text];
    RLMResults<AccountInfo *> *accountInfos = [AccountInfo objectsWithPredicate:pred];
    if (accountInfos.count >0){
        //检查密码是否正确
        RLMResults<AccountInfo *> *accountTmp = [accountInfos objectsWhere:@"accountPWD = %@",self.pwd.text];
        if (accountTmp.count > 0){
            AccountInfo *accountInfo = [accountTmp firstObject];
            //登录
            [self loginDB:accountInfo];
        }else{
            SCLAlertView *alert = [[SCLAlertView alloc] init];
            [alert showError:self title:@"提示" subTitle:@"密码错误" closeButtonTitle:@"确定" duration:0.0f];
        }
    }else {
        //弹窗提示 注册
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        alert.shouldDismissOnTapOutside = YES;
        [alert alertIsDismissed:^{
            [self regist];
        }];
        [alert showInfo:self title:@"提示" subTitle:@"您还未注册" closeButtonTitle:@"现在注册" duration:0.0f];
    }
}

-(void)loginDB:(AccountInfo *)accountInfo{
    RLMResults<Account*> *accounts = [Account allObjects];
    Account * addAccount = [[Account alloc] initWithValue:@{@"mobileNo":accountInfo.mobileNo}];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteObjects:accounts];
    [realm addObject:addAccount];
    accountInfo.isValid = @YES;
    [realm addObject:accountInfo];
    [realm commitWriteTransaction];
    UserModel *model = [[UserModel alloc] init];
    model.accountName = self.accountNo.text;
    model.mobileNo = self.accountNo.text;
    model.isLogin = YES;
    [UserManager getInstance].userModel = model;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)regist{
    UIViewController *nextVC = SelfSBVC(@"Login", @"RegistViewController");
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)registClick:(id)sender {
    [self regist];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
