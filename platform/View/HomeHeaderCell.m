//
//  HomeHeaderCell.m
//  platform
//
//  Created by chliu.brook on 13/07/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "HomeHeaderCell.h"

@interface HomeHeaderCell()<SDCycleScrollViewDelegate>{
    NSArray *_topBannerArray;
}

@end

@implementation HomeHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _topBannerArray = @[@"topBanner1.jpg",@"topBanner2.jpg",@"topBanner1.jpg",@"topBanner2.jpg"];
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) shouldInfiniteLoop:YES imageNamesGroup:_topBannerArray];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.contentView addSubview:cycleScrollView];
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    
}

#pragma mark SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    ProductInfoModel *data = [[ProductInfoModel alloc] init];
    data.productId = @"";
    data.productName = [_topBannerArray objectAtIndex:index];
    self.cellClickBlock(data);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
