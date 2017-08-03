//
//  KDShopPOI_InfoModel.h
//  KDMeiTuan
//
//  Created by Starkda  on 2017/8/2.
//  Copyright © 2017年 Starkda . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDShopPOI_InfoModel : NSObject
///头部背景图片
@property (nonatomic, copy) NSString *poi_back_pic_url;

+ (instancetype)shopPOI_infoWithDict:(NSDictionary *)dict;
@end
