//
//  HMInfoModel.m
//  HMWaiMai
//
//  Created by apple on 2017/7/31.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "HMInfoModel.h"

@implementation HMInfoModel
+ (instancetype)infoWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end
