//
//  AccountModel.h
//  platform
//
//  Created by chliu.brook on 06/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import <Realm/Realm.h>

@interface AccountModel : RLMObject
@property (nonatomic,copy) NSString *accountId;
@property (nonatomic,copy) NSString *accountName;
@property (nonatomic,copy) NSString *accountImg;

@property (nonatomic,copy) NSString *mobile;
@property (nonatomic,copy) NSString *isValid;
@property (nonatomic,copy) NSDate *createDate;
@end
