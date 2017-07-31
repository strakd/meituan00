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


@interface KDShopController ()
@property (nonatomic, weak) UIView *shopHeaderView;
@property (nonatomic, strong) UIBarButtonItem *rightBurronItem;

@end

@implementation KDShopController

- (void)viewDidLoad {
    
    //此行投机写法,为了让他比导航条先添加
    [self setupUI];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航控制器背景颜色
    self.view.backgroundColor = [UIColor yellowColor];
    
    //设置导航条的标题
    self.navItem.title = @"🐸青蛙点餐";
    
    //设置导航标题文字颜色 为透明
    self.navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithWhite:.4 alpha:0]};
    
    
    //默认导航条的背景图片完全透明
    self.navBar.BGImageView.alpha = 0;
    
    //设置导航条右边分享按钮
    _rightBurronItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_share"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navItem.rightBarButtonItem = _rightBurronItem;
    self.navBar.tintColor = [UIColor whiteColor];
    
    
    
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


- (void)setupUI{
    
    UIView *shopHeaderview = [[UIView alloc] init];
    
    shopHeaderview.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:shopHeaderview];
    
    [shopHeaderview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.offset(180);
    }];
    
    
    //添加平移
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
 
    
    //添加手势到控制器的view上
    [self.view addGestureRecognizer:pan];
    
    _shopHeaderView = shopHeaderview;
    
    
}


//
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
