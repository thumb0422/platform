//
//  CategoryContentCell.m
//  platform
//
//  Created by chliu.brook on 18/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "CategoryContentCell.h"

@implementation CategoryContentCell

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (UIImageView *)imageView{
    if (!_imageView){
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

@end
