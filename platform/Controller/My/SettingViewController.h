//
//  SettingViewController.h
//  platform
//
//  Created by chliu.brook on 16/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;
- (IBAction)logoutClick:(id)sender;

@end
