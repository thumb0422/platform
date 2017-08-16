//
//  UserManager.m
//  platform
//
//  Created by chliu.brook on 16/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

static id _instance = nil;
+ (instancetype)getInstance{
    return [[self alloc] init];
}

/**
 重写allocWithZone方法，用来保证其他人直接使用alloc和init试图获得一个新实力的时候不产生一个新实例
 */

+(id)allocWithZone:(NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

//copy在底层 会调用copyWithZone:
- (id)copyWithZone:(NSZone *)zone{
    return  _instance;
}

+ (id)copyWithZone:(struct _NSZone *)zone{
    return  _instance;
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone{
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}

- (id)init{
    self = [super init];
    if (self){
        
    }
    return self;
}

- (void)setUserModel:(UserModel *)userModel{
    _userModel = userModel;
    _userModel.accountName = userModel.mobileNo;
}
@end
