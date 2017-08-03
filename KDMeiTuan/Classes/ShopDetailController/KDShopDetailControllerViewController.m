//
//  KDShopDetailControllerViewController.m
//  KDMeiTuan
//
//  Created by Starkda  on 2017/8/3.
//  Copyright © 2017年 Starkda . All rights reserved.
//

#import "KDShopDetailControllerViewController.h"
#import "KDShopPOI_InfoModel.h"
#import "HMInfoView.h"
#import "HMInfoModel.h"

@interface KDShopDetailControllerViewController ()

@end

@implementation KDShopDetailControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self setupUI];
    
}



- (void)setupUI{
    
    //TODO:添加背景图片
    UIImageView *bgImageView = [[UIImageView alloc] init];
    
    [bgImageView sd_setImageWithURL:[NSURL URLWithString:[_shopPOIInfoModel.poi_back_pic_url stringByDeletingPathExtension]]];
    
    [self.view addSubview:bgImageView];
    
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
        make.right.bottom.left.top.offset(0);
        
        
//        make.edges.mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
        
        //四边边距
//        make.edges.offset(0);
        
    }];
    
    
    
    //TODO:添加关闭按钮
    UIButton *closeBtn = [[UIButton alloc] init];
    [closeBtn setImage:[UIImage imageNamed:@"btn_close_normal"] forState:UIControlStateNormal];
    
    [closeBtn setImage:[UIImage imageNamed:@"btn_close_selected"] forState:UIControlStateHighlighted];
    
    [self.view addSubview:closeBtn];
    
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.offset(-60);
        
    }];
    
    
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //TODO:添加滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    
    scr
    
    
    
}

#pragma mark -关闭按钮调用的方法
- (void)closeBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
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
