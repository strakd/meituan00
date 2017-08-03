//
//  UIView+Addition.m
//  HMWaiMai
//
//  Created by apple on 2017/8/2.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "UIView+Addition.h"

@implementation UIView (Addition)
- (UIViewController *)viewControler {
    
    // 获取下一个响应者对象
    UIResponder *resp = [self nextResponder];
    
    // 只要有响应者就一直循环
    while (resp) {
        
        // 如果当前对象是控制器那直接返回
        if ([resp isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)resp;
        }
        // 如果当前这个响应者不是控制器,那就继续找下一个响应者
        resp = [resp nextResponder];
    }
    
    return nil;
}
@end
