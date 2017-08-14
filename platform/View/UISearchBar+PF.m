//
//  UISearchBar+PF.m
//  platform
//
//  Created by chliu.brook on 15/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "UISearchBar+PF.h"
#import "UIImage+Utility.h"
@implementation UISearchBar (PF)

- (void)updateBGClear:(UIColor *)color{
    UIImage* clearImg = [UIImage imageWithColor:color andHeight:1.0f];
    [self setScopeButtonTitles:nil];
    [self setScopeBarBackgroundImage:clearImg];
    [self setScopeBarButtonBackgroundImage:clearImg forState:UIControlStateNormal];
    [self setScopeBarButtonDividerImage:clearImg forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal];
    for (UIView *subView in self.subviews) {
        for (UIView *grandsonView in subView.subviews){
            if ([grandsonView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]){
                grandsonView.alpha = 0.0f;
            }else if ([grandsonView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]){
                
            }else {
                grandsonView.alpha = 0.0f;
            }
        }
    }
}
@end
