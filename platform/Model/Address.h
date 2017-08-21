//
//  Address.h
//  platform
//
//  Created by chliu.brook on 21/08/2017.
//Copyright © 2017 chliu.brook. All rights reserved.
//

#import <Realm/Realm.h>

@interface Address : RLMObject
@property NSString *addressId;//id
@property NSString *addressContent;//收件人地址
@property NSString *mobile;//收件人电话
@property NSString *receiverName;//收件人
@property NSDate *createDate;//创建日期
@property BOOL isValid;//是否有效
@property BOOL isDefault;//是否是默认
@end

RLM_ARRAY_TYPE(Address)
