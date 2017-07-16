//
//  BaseTableViewCell.h
//  platform
//
//  Created by chliu.brook on 15/07/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductInfoModel.h"

typedef void(^CellClick)(ProductInfoModel *data);

@interface BaseTableViewCell : UITableViewCell

@property(nonatomic,copy) CellClick cellClickBlock;
@end
