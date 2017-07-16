//
//  HomeCollectionTableViewCell.h
//  platform
//
//  Created by chliu.brook on 15/07/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//  tableViewCell里是一个collectionView

#import <UIKit/UIKit.h>

@interface HomeCollectionTableViewCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
