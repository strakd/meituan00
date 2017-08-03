//
//  UIImage+DashLine.h
//  HMWaiMai
//
//  Created by apple on 2017/7/31.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DashLine)

/**
 通过传颜色返回一个指定颜色的虚线
 */
+ (instancetype)dashLineViewWithColor:(UIColor *)color;
@end
