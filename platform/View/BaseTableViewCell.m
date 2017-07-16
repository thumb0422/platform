//
//  BaseTableViewCell.m
//  platform
//
//  Created by chliu.brook on 15/07/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setFrame:CGRectMake(self.left, self.top, SCREEN_WIDTH, self.height)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
