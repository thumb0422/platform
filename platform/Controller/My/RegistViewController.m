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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registClick:(id)sender {
    AccountInfo *accountInfo = [[AccountInfo alloc] init];
    accountInfo.accountName = self.phoneNo.text;
    accountInfo.mobileNo = self.phoneNo.text;
    accountInfo.accountPWD = self.pwd.text;
    accountInfo.isValid = @YES;
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:accountInfo];
    [realm commitWriteTransaction];
    
    //弹窗提示 注册
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    alert.shouldDismissOnTapOutside = YES;
    [alert alertIsDismissed:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    [alert showInfo:self title:@"" subTitle:@"注册成功" closeButtonTitle:@"注册成功" duration:0.0f];
}

@end
