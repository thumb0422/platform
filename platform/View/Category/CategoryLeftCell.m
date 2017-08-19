//
//  CategoryLeftCell.m
//  platform
//
//  Created by chliu.brook on 18/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "CategoryLeftCell.h"

@interface CategoryLeftCell(){
    UILabel *leftLabel;
    UIImageView *rightImg;
}

@end

@implementation CategoryLeftCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        leftLabel = [[UILabel alloc] init];
        leftLabel.textColor = [UIColor blackColor];
        leftLabel.textAlignment = NSTextAlignmentLeft;
        leftLabel.font = [UIFont systemFontOfSize:14];
        leftLabel.minimumScaleFactor = 0.7;
        leftLabel.numberOfLines = 1;
        [self.contentView addSubview:leftLabel];
        
        rightImg = [[UIImageView alloc] init];
        rightImg.contentMode = UIViewContentModeRight;
        rightImg.image = [UIImage imageNamed:@"forward"];
        [self.contentView addSubview:rightImg];
        
        [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self);
            make.width.equalTo(@(self.width * 3/5));
        }];
        
        [rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
            make.right.equalTo(self.mas_right).offset(-5);
            make.left.equalTo(leftLabel.mas_right).offset(3);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)updateData:(NSString *)data{
    leftLabel.text = data;
}
@end
