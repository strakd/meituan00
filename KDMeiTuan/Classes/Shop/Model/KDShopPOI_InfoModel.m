//
//  KDShopPOI_InfoModel.m
//  KDMeiTuan
//
//  Created by Starkda  on 2017/8/2.
//  Copyright © 2017年 Starkda . All rights reserved.
//

#import "KDShopPOI_InfoModel.h"
#import "HMInfoModel.h"

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
    // 判断抛出的key是不是我们想要的
    if ([key isEqualToString:@"discounts2"]) {
        // 所有优惠信息
        NSArray *discountsArray = value;
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:discountsArray.count];
        for (NSDictionary *dict in discountsArray) {
            HMInfoModel *infoModel = [HMInfoModel infoWithDict:dict];
            [arrM addObject:infoModel];
        }
        // 给模型属性赋值
        _discounts = arrM.copy;
        
    }

}
@end
