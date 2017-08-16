//
//  SettingViewController.m
//  platform
//
//  Created by chliu.brook on 16/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "SettingViewController.h"
#import "AccountInfo.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    // Do any additional setup after loading the view.
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

- (IBAction)logoutClick:(id)sender {
    Account *_account = [[Account allObjects] firstObject];
    if (_account != nil){
        //防止有脏数据，故把所有的都更新下
      RLMResults<AccountInfo *>  *_accountInfos= [AccountInfo objectsWhere:@"mobileNo = %@",_account.mobileNo];
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            for (int i = 0;i<_accountInfos.count;i++){
                AccountInfo *_accountInfo = [_accountInfos objectAtIndex:i];
                _accountInfo.isValid = NO;
            }
        }];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
