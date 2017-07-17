//
//  HomeCompsiteTableViewCell.m
//  platform
//
//  Created by chliu.brook on 17/07/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "HomeCompsiteTableViewCell.h"

@interface HomeCompsiteTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UIImageView *topImgView;
@property (weak, nonatomic) IBOutlet UIImageView *leftTopImgView;
@property (weak, nonatomic) IBOutlet UIImageView *rightTopImgView;
@property (weak, nonatomic) IBOutlet UIImageView *leftBottomImgView;
@property (weak, nonatomic) IBOutlet UIImageView *rightBottomImgView;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

@end

@implementation HomeCompsiteTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if ([obj isKindOfClass:[UIImageView class]]){
//            UITapGestureRecognizer *leftGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onImageClick:)];
//            [obj addGestureRecognizer:leftGest];
//        }
//    }];
    
    UITapGestureRecognizer *leftGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onImageClick:)];
    [self.topImgView addGestureRecognizer:leftGest];
    
    UITapGestureRecognizer *leftTopGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onImageClick:)];
    [self.leftTopImgView addGestureRecognizer:leftTopGest];
    
    UITapGestureRecognizer *rightTopGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onImageClick:)];
    [self.rightTopImgView addGestureRecognizer:rightTopGest];
    
    UITapGestureRecognizer *leftBottomGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onImageClick:)];
    [self.leftBottomImgView addGestureRecognizer:leftBottomGest];
    
    UITapGestureRecognizer *rightBottomGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onImageClick:)];
    [self.rightBottomImgView addGestureRecognizer:rightBottomGest];
}

-(void)onImageClick:(UITapGestureRecognizer *)sender{
    UIImageView *tmpImgView = (UIImageView *)[sender view];
    NSInteger tag = tmpImgView.tag;
    ProductInfoModel *model = [[ProductInfoModel alloc] init];
    model.productName = @"HomeCompsiteTableViewCell";
    model.productId = [NSString stringWithFormat:@"Id %ld",tag];
    self.cellClickBlock(model);
}

-(void)setImageArray:(NSArray *)imageArray{
    [self.topImgView setTag:1];
    [self.leftTopImgView setTag:2];
    [self.rightTopImgView setTag:3];
    [self.leftBottomImgView setTag:4];
    [self.rightBottomImgView setTag:5];
    [self.topImgView setImage:[UIImage imageNamed:[imageArray objectAtIndex:0]]];
    [self.leftTopImgView setImage:[UIImage imageNamed:[imageArray objectAtIndex:1]]];
    [self.rightTopImgView setImage:[UIImage imageNamed:[imageArray objectAtIndex:2]]];
    [self.leftBottomImgView setImage:[UIImage imageNamed:[imageArray objectAtIndex:3]]];
    [self.rightBottomImgView setImage:[UIImage imageNamed:[imageArray objectAtIndex:4]]];
}

- (IBAction)moreBtnClick:(UIButton *)sender {
    ProductInfoModel *model = [[ProductInfoModel alloc] init];
    model.productName = @"HomeCompsiteTableViewCell";
    model.productId = @"moreBtn";
    self.cellClickBlock(model);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
