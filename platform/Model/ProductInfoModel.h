//
//  ProductInfoModel.h
//  platform
//
//  Created by chliu.brook on 16/07/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import <Realm/Realm.h>

@interface ProductInfoModel : RLMObject
@property NSString *productId;//商品编号
@property NSString *productName;//商品名称
@property NSString *bigClass;//所属大分类
@property NSString *subClass;//所属小分类
@property float costPrice;//成本价
@property float salePrice;//售价
@property float promotionPrice;//折扣价
@end
