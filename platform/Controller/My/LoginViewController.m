//
//  LoginViewController.m
//  platform
//
//  Created by chliu.brook on 01/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)registClick:(id)sender {
    SCLAlertView *alertView = [[SCLAlertView alloc] initWithNewWindow];
    SCLButton *successBtn = [alertView addButton:@"返回" actionBlock:^{
       [self.navigationController popViewControllerAnimated:YES];
    }];
    successBtn.buttonFormatBlock = ^NSDictionary *{
        NSMutableDictionary *buttonConfig = [[NSMutableDictionary alloc] init];
        buttonConfig[@"backgroundColor"] = [UIColor whiteColor];
        buttonConfig[@"textColor"] = [UIColor blackColor];
        buttonConfig[@"borderWidth"] = @2.0f;
        buttonConfig[@"borderColor"] = [UIColor greenColor];
        return buttonConfig;
    };
    [alertView showSuccess:@"注册提示" subTitle:@"您已经注册成功" closeButtonTitle:@"确定" duration:0.0f];
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
