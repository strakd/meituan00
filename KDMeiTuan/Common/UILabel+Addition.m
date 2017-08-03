//
//  UILabel+Addition.m
//  01-生活圈
//
//  Created by apple on 16/11/7.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "UILabel+Addition.h"

@implementation UILabel (Addition)
+ (UILabel *)makeLabelWithText:(NSString *)text andTextFont:(CGFloat)font andTextColor:(UIColor *)color {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    // 设置字体大小
    label.font = [UIFont systemFontOfSize:font];
    // 设置文字颜色
    label.textColor = color;
    
    return label;
}
@end
