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

- (IBAction)logoutClick:(id)sender {
    Account *_account = [[Account allObjects] firstObject];
    if (_account != nil){
        //防止有脏数据，故把所有的都更新下
        RLMResults<AccountInfo *>  *_accountInfos= [AccountInfo objectsWhere:@"mobileNo = %@",_account.mobileNo];
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [_accountInfos setValue:@NO forKey:@"isValid"];
        }];
    }
    [[[UserManager getInstance] userModel] reset];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
