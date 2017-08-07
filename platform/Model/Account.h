//
//  Account.h
//  platform
//
//  Created by chliu.brook on 07/08/2017.
//Copyright © 2017 chliu.brook. All rights reserved.
//

#import <Realm/Realm.h>

@interface Account : RLMObject
@property NSString *accountId;
@property NSString *accountName;
@property NSString *accountImg;

@property NSString *mobile;
@property BOOL isValid;
@property (nonatomic,copy) NSDate *createDate;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Account *><Account>
RLM_ARRAY_TYPE(Account)
