//
//  AccountInfo.m
//  platform
//
//  Created by chliu.brook on 12/08/2017.
//Copyright © 2017 chliu.brook. All rights reserved.
//

#import "AccountInfo.h"

@implementation AccountInfo

+ (NSString *)primaryKey{
    return @"accountId";
}

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"accountId"  :[[NSUUID UUID] UUIDString],
             @"isValid"    :@NO,
             @"createDate" :[NSDate date],
             };
}

+ (NSArray *)requiredProperties{
    return @[@"accountId",@"mobileNo"];
}

+ (NSArray *)indexedProperties{
    return @[@"mobileNo"];
}
// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
