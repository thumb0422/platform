//
//  Account.m
//  platform
//
//  Created by chliu.brook on 07/08/2017.
//Copyright © 2017 chliu.brook. All rights reserved.
//

#import "Account.h"

@implementation Account

// Specify default values for properties

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"accountId":[NSString uuidString],@"isValid":[NSNumber numberWithBool:NO]};
}

// Specify properties to ignore (Realm won't persist these)

+ (NSArray *)ignoredProperties
{
    return @[@"createDate"];
}

+ (NSString *)primaryKey{
    return @"accountId";
}

-(NSDate *)createDate{
    return [NSDate date];
}
@end
