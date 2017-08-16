//
//  UserModel.h
//  platform
//
//  Created by chliu.brook on 16/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (nonatomic,copy) NSString *accountId;
@property (nonatomic,copy) NSString *accountName;
@property (nonatomic,copy) NSString *mobileNo;
@property (nonatomic,assign) Boolean isLogin;

- (void)reset;
@end
