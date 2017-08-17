//
//  ResetPWDViewController.m
//  platform
//
//  Created by chliu.brook on 17/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "ResetPWDViewController.h"

@interface ResetPWDViewController ()
@property (weak, nonatomic) IBOutlet UITextField *pwdNew;
@property (weak, nonatomic) IBOutlet UITextField *pwdNewConfirm;
@end

@implementation ResetPWDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"密码重置";
}
- (IBAction)confirmClick:(id)sender {
    //重置密码
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
