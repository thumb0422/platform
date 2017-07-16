//
//  HomeTopBottomTableViewCell.m
//  platform
//
//  Created by chliu.brook on 15/07/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "HomeTopBottomTableViewCell.h"

@interface HomeTopBottomTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *topImg;
@property (weak, nonatomic) IBOutlet UIImageView *leftImg;
@property (weak, nonatomic) IBOutlet UIImageView *rightImg;
@end

@implementation HomeTopBottomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UITapGestureRecognizer *topGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onImageClick:)];
    [self.topImg addGestureRecognizer:topGest];
    
    UITapGestureRecognizer *leftGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onImageClick:)];
    [self.leftImg addGestureRecognizer:leftGest];
    
    UITapGestureRecognizer *rightGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onImageClick:)];

    [self.rightImg addGestureRecognizer:rightGest];
}

-(void)setImageArray:(NSArray *)imageArray{
    [self.topImg setTag:1];
    [self.leftImg setTag:2];
    [self.rightImg setTag:3];
    
    [self.topImg setImage:[UIImage imageNamed:[imageArray objectAtIndex:0]]];
    [self.leftImg setImage:[UIImage imageNamed:[imageArray objectAtIndex:1]]];
    [self.rightImg setImage:[UIImage imageNamed:[imageArray objectAtIndex:2]]];
}

-(void)onImageClick:(UITapGestureRecognizer *)sender{
    UIImageView *tmpImgView = (UIImageView *)[sender view];
    NSInteger tag = tmpImgView.tag;
    ProductInfoModel *model = [[ProductInfoModel alloc] init];
    model.productName = [NSString stringWithFormat:@"imageName %ld",tag];
    model.productId = [NSString stringWithFormat:@"Id %ld",tag];
    self.cellClickBlock(model);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
