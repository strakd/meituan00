//
//  KDShopController.m
//  KDMeiTuan
//
//  Created by Starkda  on 2017/7/30.
//  Copyright © 2017年 Starkda . All rights reserved.
//

#import "KDShopController.h"
#import "KDFoodDetailController.h"
#import "KDNavigationBar.h"
#import "KDMeiTuan.pch"

@interface KDShopController ()
//头部视图
@property (nonatomic, weak) UIView *shopHeaderView;
//导航栏右侧的添加
@property (nonatomic, strong) UIBarButtonItem *rightBurronItem;
//这个是
@property (nonatomic, weak) UIView *shopTagView;


@end

@implementation KDShopController

- (void)viewDidLoad {
    
    //此行投机写法,为了让他比导航条先添加
    [self setupUI];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航控制器背景颜色
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self settingNormal];
    
    
}


#pragma mark -默认设置
- (void)settingNormal{
    
    //设置导航条的标题
    self.navItem.title = @"🐸青蛙点餐";
    
    //设置导航标题文字颜色 为透明
    self.navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithWhite:.4 alpha:0]};
    
    
    //默认导航条的背景图片完全透明
    self.navBar.BGImageView.alpha = 0;
    
    //设置导航条右边分享按钮
    _rightBurronItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_share"] style:UIBarButtonItemStylePlain target:nil action:nil];
    //设置导航条右边按钮
    self.navItem.rightBarButtonItem = _rightBurronItem;
    //设置导航条主题色
    self.navBar.tintColor = [UIColor whiteColor];
    
    //添加平移
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    
    
    //添加手势到控制器的view上
    [self.view addGestureRecognizer:pan];

    
}


//轻触一下
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//    
//    KDFoodDetailController *foodDeatilVC = [[KDFoodDetailController alloc] init];
//    
//    //设置push
//    [self.navigationController pushViewController:foodDeatilVC animated:YES];
//    
//    
//}

#pragma mark -界面处理
- (void)setupUI{
    
    // TODO: 创建及添加头部视图
    [self settingShopHeaderView];
    
    // TODO: 添加标签栏
    [self settingShopTagView];
    
    // TODO: 添加滚动视图(scrollview)
    [self settingShopScrollView];
}

#pragma mark -添加头部视图
- (void)settingShopHeaderView{
    
    //创建及添加头部视图
    UIView *shopHeaderview = [[UIView alloc] init];
    
    shopHeaderview.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:shopHeaderview];
    
    [shopHeaderview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.offset(180);
    }];
    
    
   
    
    _shopHeaderView = shopHeaderview;
}


#pragma mark -添加标签栏
- (void)settingShopTagView{
    UIView *shopTagView = [[UIView alloc] init];
    shopTagView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:shopTagView];
    
    [shopTagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(_shopHeaderView.mas_bottom).offset(0);
        make.height.offset(44);
    }];
    
    _shopTagView = shopTagView;
    
    UIButton *orderBtn = [self makeShopTagButtonWithTitle:@"点菜"];
    [self makeShopTagButtonWithTitle:@"评价"];
    [self makeShopTagButtonWithTitle:@"商家"];
    
    [shopTagView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
    }];
    
    [shopTagView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    // TODO: 添加模拟滚动指示小黄条
    UIView *shopTagLineView = [[UIView alloc] init];
    shopTagLineView.backgroundColor = [UIColor primaryYellowColor];
    [shopTagView addSubview:shopTagLineView];
    
    [shopTagLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(50);
        make.height.offset(4);
        make.bottom.offset(0);
        
        //小黄条添加约束的代码要写在按钮添加约束的后面
        make.centerX.equalTo(orderBtn).offset(0);
    }];
}

#pragma mark -创建及添加标签栏中的按钮
- (UIButton *)makeShopTagButtonWithTitle:(NSString *)title{
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    //把按钮添加到标签栏中
    [_shopTagView addSubview:btn];
    
    return btn;
}


#pragma mark - 添加滚动视图(scrollview)
- (void)settingShopScrollView{
    //创建滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.top.equalTo(_shopTagView.mas_bottom).offset(0);
    }];
    
    
}


#pragma mark -控制器view平移手势触发时调用的方法
- (void)panGesture:(UIPanGestureRecognizer *)pan{
    //获得平移的距离
    CGPoint p = [pan translationInView:pan.view];
    
    //头部视图的高度
    CGFloat shopHeaderViewUpdateHeight = _shopHeaderView.bounds.size.height;
    
    [_shopHeaderView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        
//        make.height.offset(p.y + _shopHeaderView.bounds.size.height);
        
    //如果它当时的高度加上平移的值 <= 64 直接就让他变成到64
    if(p.y + shopHeaderViewUpdateHeight < 64){
    
        make.height.offset(64);
        
        //如果他当前的高度加上平移的值 >= 180 直接让它变成180
    }else if(p.y + shopHeaderViewUpdateHeight >= 180){
        
        make.height.offset(180);
    }else{
        //在大于64及小于180之间让它慢慢变化
        make.height.offset(p.y + shopHeaderViewUpdateHeight);
    }
    
        
    }];

    
    //计算导航条背景图片的透明度
    CGFloat alpha = [self resultWithConsult:shopHeaderViewUpdateHeight andConsult1:64 andResult1:1 andConsult2:180 andResult2:0];
    
    self.navBar.BGImageView.alpha = alpha;
    
    
    //设置导航条标题文字颜色和掉焊条背景变化是一样的
    self.navBar.titleTextAttributes = @{NSForegroundColorAttributeName :[UIColor colorWithWhite:.4 alpha:alpha]};
    
    
    //计算分享按钮的白色值
    CGFloat white = [self resultWithConsult:shopHeaderViewUpdateHeight andConsult1:64 andResult1:.4 andConsult2:180 andResult2:1];
    
    //设置分类按钮颜色
    self.navBar.tintColor = [UIColor colorWithWhite:white alpha:1];
    
    
    //如果当时是180高度就用白色状态栏,反之用黑色
    if (shopHeaderViewUpdateHeight == 180 && self.statrsBarStyle != UIStatusBarStyleLightContent) {
        self.statrsBarStyle = UIStatusBarStyleLightContent;
        
    }else if(shopHeaderViewUpdateHeight == 64 && self.statrsBarStyle != UIStatusBarStyleDefault){
        self.statrsBarStyle = UIStatusBarStyleDefault;
        
    }
    
    
    
    
    //恢复到初始值
    [pan setTranslation:CGPointZero inView:pan.view];
    
}




//把通过二元一次计算透明度包装成小方法
- (CGFloat)resultWithConsult:(CGFloat)consult andConsult1:(CGFloat)consult1 andResult1:(CGFloat)result1 andConsult2:(CGFloat)consult2 andResult2:(CGFloat)result2{
    
    CGFloat a = (result1 - result2) / (consult1 - consult2);
    
    CGFloat b = result1 - (a * consult1);
    
    
    return a * consult + b;
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
