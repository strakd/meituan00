//
//  KDShopHeaderView.m
//  KDMeiTuan
//
//  Created by Starkda  on 2017/8/2.
//  Copyright © 2017年 Starkda . All rights reserved.
//

#import "KDShopHeaderView.h"
#import "KDShopPOI_InfoModel.h"

@interface KDShopHeaderView ()
///背景imageView
@property (nonatomic, weak) UIImageView *backImageView;


@end


@implementation KDShopHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    //1.添加背景图片
    UIImageView *backImageView = [[UIImageView alloc] init];
    
    //设置填充模式
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self addSubview:backImageView];
    
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    _backImageView = backImageView;
}

#pragma mark -有了数据之后给子控件设置数据
//重写set方法?
- (void)setShopPOI_InfoModel:(KDShopPOI_InfoModel *)shopPOI_InfoModel{
    _shopPOI_InfoModel = shopPOI_InfoModel;
    
    
    //删除URL后面多余的.Webp后缀
    NSString *bgImageURLStr = [shopPOI_InfoModel.poi_back_pic_url stringByDeletingPathExtension];
    //设置背景图片
    [_backImageView sd_setImageWithURL:[NSURL URLWithString:bgImageURLStr]];
}



@end
