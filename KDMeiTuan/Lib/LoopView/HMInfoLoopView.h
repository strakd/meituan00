//
//  HMInfoLoopView.h
//  HMWaiMai
//
//  Created by apple on 2017/7/31.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMInfoModel;
@interface HMInfoLoopView : UIView
/// 所有优惠信息的数据
@property (nonatomic, strong) NSArray<HMInfoModel *> *discounts;
@end
