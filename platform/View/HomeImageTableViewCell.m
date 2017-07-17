//
//  HomeImageTableViewCell.m
//  platform
//
//  Created by chliu.brook on 15/07/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "HomeImageTableViewCell.h"

@implementation HomeImageTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UITapGestureRecognizer *topGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onImageClick:)];
    [self.imageView addGestureRecognizer:topGest];
}

-(void)onImageClick:(UITapGestureRecognizer *)sender{
    UIImageView *tmpImgView = (UIImageView *)[sender view];
    NSInteger tag = tmpImgView.tag;
    ProductInfoModel *model = [[ProductInfoModel alloc] init];
    model.productName = @"HomeImageTableViewCell";
    model.productId = [NSString stringWithFormat:@"Id %ld",tag];
    self.cellClickBlock(model);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
