//
//  KDShopHeaderView.m
//  KDMeiTuan
//
//  Created by Starkda  on 2017/8/2.
//  Copyright © 2017年 Starkda . All rights reserved.
//

#import "KDShopHeaderView.h"
#import "KDShopPOI_InfoModel.h"
#import "HMInfoLoopView.h"
#import "KDShopDetailControllerViewController.h"

@interface KDShopHeaderView ()
///背景imageView
@property (nonatomic, weak) UIImageView *backImageView;
///头像
@property (nonatomic, weak) UIImageView *avatarView;
///店名
@property (nonatomic, weak) UILabel *nameLabel;
///商家公告
@property (nonatomic, weak) UILabel *bulletinLabel;
///轮播优惠信息
@property (nonatomic, weak) HMInfoLoopView *loopView;

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
    
    
    
    //2.轮播视图
    HMInfoLoopView *loopView = [[HMInfoLoopView alloc] init];
    //把子控件超出的区域裁剪
    loopView.clipsToBounds = YES;
    [self addSubview:loopView];
    
    [loopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.bottom.offset(-8);
        make.height.offset(20);
    }];
    //2.1添加轮播视图右边的小箭头
    UIImageView *arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_arrow_white"]];
    [loopView addSubview:arrowView];
    
    [arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.offset(0);
    }];
    
    
    
    //3.虚线
    UIView *dashLineView = [[UIView alloc] init];
    dashLineView.backgroundColor = [UIColor colorWithPatternImage:[UIImage dashLineViewWithColor:[UIColor whiteColor]]];
    [self addSubview:dashLineView];
    
    [dashLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(loopView).offset(0);
        make.right.offset(0);
        make.bottom.equalTo(loopView.mas_top).offset(-8);
        make.height.offset(1);
    }];
    
    //4.头像
    UIImageView *avatarView = [[UIImageView alloc] init];
    avatarView.backgroundColor = [UIColor brownColor];
    [self addSubview:avatarView];
    
    //设置圆角
    avatarView.layer.cornerRadius = 32;

    //超出边界的裁减掉
    avatarView.clipsToBounds = YES;
    
    //设置边框颜色
    avatarView.layer.backgroundColor = [UIColor colorWithWhite:1 alpha:.7].CGColor;
    
    //边框宽度
    avatarView.layer.borderWidth = 2;
    
    [avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(dashLineView).offset(0);
        make.bottom.equalTo(dashLineView.mas_top).offset(-8);
        make.width.height.offset(64);
    }];
    
    
    //5.店名
    UILabel *nameLable = [UILabel makeLabelWithText:@"良心发现" andTextFont:16
                                       andTextColor:[UIColor whiteColor]];
    [self addSubview:nameLable];
    
    [nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(avatarView.mas_right).offset(16);
        make.centerY.equalTo(avatarView).offset(-16);
    }];
    
    //6.商家公告
    UILabel *bulletinLabel = [UILabel makeLabelWithText:@"法法师的法师打发斯蒂芬" andTextFont:14
                                           andTextColor:[UIColor colorWithWhite:1 alpha:.7]];
    [self addSubview:bulletinLabel];
    
    [bulletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLable).offset(0);
        make.centerY.equalTo(avatarView).offset(16);
        make.right.offset(-16);
    }];
    
    
    _backImageView = backImageView;
    
    _avatarView = avatarView;
    
    _nameLabel = nameLable;
 
    _bulletinLabel = bulletinLabel;
    
    _loopView = loopView;
    
    
    //TODO:给轮播视图添加点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loopViewClick)];
    
    //添加手势到loopView上
    [loopView addGestureRecognizer:tap];
    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //一启动让它模态出商家详情控制器
                [self loopViewClick];
    });
    
    
    

    
}


#pragma mark -轮播视图点击手势调用的方法
- (void)loopViewClick{
    //1.创建商家详情控制器
    KDShopDetailControllerViewController *detailVC = [[KDShopDetailControllerViewController alloc] init];
    
    //2.给商家相亲跟控制器传数据
    detailVC.shopPOIInfoModel = _shopPOI_InfoModel;
    
    //3.模态商家详情控制器
    [self.viewControler presentViewController:detailVC animated:YES completion:nil];
    
    
    
}





#pragma mark -有了数据之后给子控件设置数据
//重写set方法?
- (void)setShopPOI_InfoModel:(KDShopPOI_InfoModel *)shopPOI_InfoModel{
    _shopPOI_InfoModel = shopPOI_InfoModel;
    
    
    //删除URL后面多余的.Webp后缀
    NSString *bgImageURLStr = [shopPOI_InfoModel.poi_back_pic_url stringByDeletingPathExtension];
    //设置背景图片
    [_backImageView sd_setImageWithURL:[NSURL URLWithString:bgImageURLStr]];
    
    //设置头像
    [_avatarView sd_setImageWithURL:[NSURL URLWithString:[shopPOI_InfoModel.pic_url stringByDeletingPathExtension]]];
    
    //店名
    _nameLabel.text = shopPOI_InfoModel.name;
    
    //商家公告
    _bulletinLabel.text = shopPOI_InfoModel.bulletin;
    
    //把所有的优惠信息模型数组传给轮播视图
    _loopView.discounts = shopPOI_InfoModel.discounts;
    
}



@end
