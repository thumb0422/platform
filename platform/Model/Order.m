//
//  Order.m
//  platform
//
//  Created by chliu.brook on 21/08/2017.
//Copyright © 2017 chliu.brook. All rights reserved.
//

#import "Order.h"

@implementation OrderDetail
+ (NSString *)primaryKey{
    return @"dId";
}

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"dId"  :[[NSUUID UUID] UUIDString],
             @"count":@0,
             };
}

+ (NSArray *)requiredProperties{
    return @[@"productId",@"orderId"];
}

+ (NSArray *)indexedProperties{
    return @[@"productId"];
}

+ (NSString *)description{
    return @"订单明细";
}
@end

@implementation OrderMain
+ (NSString *)primaryKey{
    return @"orderId";
}

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"orderId"  :[[NSUUID UUID] UUIDString],
             @"isValid"    :@YES,
             @"createDate" :[NSDate date],
             @"amout" :@0.00,
             };
}

+ (NSArray *)indexedProperties{
    return @[@"orderId"];
}

+ (NSString *)description{
    return @"订单主表";
}
@end


