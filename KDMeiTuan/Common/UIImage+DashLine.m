//
//  UIImage+DashLine.m
//  HMWaiMai
//
//  Created by apple on 2017/7/31.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "UIImage+DashLine.h"

@implementation UIImage (DashLine)


+ (instancetype)dashLineViewWithColor:(UIColor *)color {
    
    // 1.开始图片类型的上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(4, 1), NO, 0);
    
    // 2.获取当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 3.画线
    CGContextMoveToPoint(ctx, 0, 1);
    CGContextAddLineToPoint(ctx, 4, 1);
    
    // 4.设置为虚线样式
    CGFloat lengths[] = {2, 2};
    CGContextSetLineDash(ctx, 0, lengths, 2);
    
    // 5.设置颜色
    [color set];
    
    // 6.渲染
    CGContextStrokePath(ctx);
    
    // 7.从图片类型上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.关闭图片类型上下文
    UIGraphicsEndImageContext();
    
    // 9.虚线样式图片返回
    return image;
    
}

@end
