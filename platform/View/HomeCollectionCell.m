//
//  HomeCollectionCell.m
//  platform
//
//  Created by liuchunhua on 2017/7/7.
//  Copyright © 2017年 chliu.brook. All rights reserved.
//

#import "HomeCollectionCell.h"

@implementation HomeCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setBackgroundColor:[UIColor clearColor]];
    self.layer.cornerRadius = 4;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor clearColor].CGColor;
//    self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2;
    self.imageView.layer.cornerRadius = 4;
}

@end
