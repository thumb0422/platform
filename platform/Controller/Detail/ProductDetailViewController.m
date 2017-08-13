//
//  ProductDetailViewController.m
//  platform
//
//  Created by chliu.brook on 13/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UIView *centerView;
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UIView *buyView;
@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self initUI];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.buyView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)initUI{
    [self.scrollView addSubview:self.topView];
    [self.scrollView addSubview:self.centerView];
    [self.scrollView addSubview:self.bottomView];
}

- (UIScrollView *)scrollView{
    if (_scrollView){
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    }
    return _scrollView;
}

- (UIView *)topView{
    if (_topView){
        
    }
    return _topView;
}

- (UIView *)centerView{
    if (_centerView){
        
    }
    return _centerView;
}

- (UIView *)bottomView{
    if (_bottomView){
        
    }
    return _bottomView;
}

- (UIView *)buyView{
    if (_buyView){
        _buyView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 44.0, SCREEN_WIDTH, 44.0)];
        _buyView.backgroundColor = [UIColor redColor];
    }
    return _buyView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
