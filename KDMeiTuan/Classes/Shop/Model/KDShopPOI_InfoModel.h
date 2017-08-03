//
//  KDShopPOI_InfoModel.h
//  KDMeiTuan
//
//  Created by Starkda  on 2017/8/2.
//  Copyright © 2017年 Starkda . All rights reserved.
//

#import <Foundation/Foundation.h>
@class HMInfoModel;
@interface KDShopPOI_InfoModel : NSObject
///头部背景图片
@property (nonatomic, copy) NSString *poi_back_pic_url;
///头像
@property (nonatomic, copy) NSString *pic_url;
///店名
@property (nonatomic, copy) NSString *name;
///商家公告
@property (nonatomic, copy) NSString *bulletin;
///轮播优惠信息
@property (nonatomic, strong) NSArray<HMInfoModel *> *discounts;

+ (instancetype)shopPOI_infoWithDict:(NSDictionary *)dict;
@end
