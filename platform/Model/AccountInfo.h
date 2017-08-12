//
//  AccountInfo.h
//  platform
//
//  Created by chliu.brook on 12/08/2017.
//Copyright © 2017 chliu.brook. All rights reserved.
//

#import <Realm/Realm.h>

@interface AccountInfo : RLMObject
@property NSString *accountId;
@property NSString *accountName;
@property NSString *accountPWD;
@property NSString *mobileNo;
@property BOOL isValid;
@property NSDate *createDate;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<AccountInfo *><AccountInfo>
RLM_ARRAY_TYPE(AccountInfo)
