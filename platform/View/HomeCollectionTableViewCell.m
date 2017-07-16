//
//  HomeCollectionTableViewCell.m
//  platform
//
//  Created by chliu.brook on 15/07/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "HomeCollectionTableViewCell.h"
#import "HomeCollectionCell.h"
#import "RFLayout.h"

static NSString *homeCollectionCellIdentifier = @"HomeCollectionCell";

@interface HomeCollectionTableViewCell(){
    NSArray *_imageArray;
}

@end

@implementation HomeCollectionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _imageArray = @[@"hotSale1.jpg",@"hotSale2.jpg",@"hotSale1.jpg",@"hotSale2.jpg"];
    [self.collectionView registerNib:[UINib nibWithNibName:homeCollectionCellIdentifier bundle:nil] forCellWithReuseIdentifier:homeCollectionCellIdentifier];
    self.collectionView.collectionViewLayout = [[RFLayout alloc] init];
}

#pragma mark UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imageArray.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeCollectionCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:homeCollectionCellIdentifier forIndexPath:indexPath];
    collectionCell.imageView.image = [UIImage imageNamed:[_imageArray objectAtIndex:indexPath.row]];
    return collectionCell;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
