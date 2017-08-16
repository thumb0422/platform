//
//  UserModel.m
//  platform
//
//  Created by chliu.brook on 16/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
- (id)init{
    self = [super init];
    if (self){
        [self reset];
    }
    return self;
}

- (void)reset{
    self.accountId = nil;
    self.accountName = nil;
    self.mobileNo = nil;
    self.isLogin = false;
}
@end
