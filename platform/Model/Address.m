//
//  Address.m
//  platform
//
//  Created by chliu.brook on 21/08/2017.
//Copyright © 2017 chliu.brook. All rights reserved.
//

#import "Address.h"

@implementation Address

+ (NSString *)primaryKey{
    return @"addressId";
}

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"addressId"  :[[NSUUID UUID] UUIDString],
             @"isValid"    :@YES,
             @"isDefault"  :@NO,
             @"createDate" :[NSDate date],
             };
}

+ (NSArray *)requiredProperties{
    return @[@"addressContent",@"mobile",@"receiverName"];
}

+ (NSArray *)indexedProperties{
    return @[@"mobile"];
}

@end
