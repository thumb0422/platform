//
//  UserManager.h
//  platform
//
//  Created by chliu.brook on 16/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface UserManager : NSObject

@property (nonatomic,strong) UserModel *userModel;

+ (instancetype)getInstance;
@end
