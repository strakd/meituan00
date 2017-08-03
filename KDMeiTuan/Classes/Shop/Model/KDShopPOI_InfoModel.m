//
//  KDShopPOI_InfoModel.m
//  KDMeiTuan
//
//  Created by Starkda  on 2017/8/2.
//  Copyright © 2017年 Starkda . All rights reserved.
//

#import "KDShopPOI_InfoModel.h"

@implementation KDShopPOI_InfoModel
//实现工厂方法

+ (instancetype)shopPOI_infoWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

//重写此方法可以解决模型属性比字典少的的问题
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
//    NSLog(@"")
    
}
@end
