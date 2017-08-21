//
//  Order.h
//  platform
//
//  Created by chliu.brook on 21/08/2017.
//Copyright © 2017 chliu.brook. All rights reserved.
// 订单模型

#import <Realm/Realm.h>
#import "Address.h"
#import "ProductInfoModel.h"

@interface OrderDetail : RLMObject
@property NSInteger dId;//id
@property NSString *productId;//商品ID
@property NSInteger count;//数量
@property NSString *orderId;//主订单号
@property ProductInfoModel *product;//商品表
@end
RLM_ARRAY_TYPE(OrderDetail)


@interface OrderMain : RLMObject
@property NSString *orderId;//订单号
@property float amout;//金额
@property RLMArray <OrderDetail *><OrderDetail> *details;//明细
@property Address *address;//邮寄地址id
@property NSString *trackingNo;//快递单号
@property BOOL isValid;//是否有效(未被删除)
@end
RLM_ARRAY_TYPE(OrderMain)


