//
//  HMInfoModel.h
//  HMWaiMai
//
//  Created by apple on 2017/7/31.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMInfoModel : NSObject
/// 图标
@property (nonatomic, copy) NSString *icon_url;
/// 信息
@property (nonatomic, copy) NSString *info;

+ (instancetype)infoWithDict:(NSDictionary *)dict;
@end
