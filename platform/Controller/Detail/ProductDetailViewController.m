//
//  ProductDetailViewController.m
//  platform
//
//  Created by chliu.brook on 13/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *bgScrollView;
@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UIView *centerView;
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UIView *buyView;
@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.bgScrollView];
    [self initUI];
    [self.view addSubview:self.buyView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.bgScrollView setContentSize:CGSizeMake(SCREEN_WIDTH, self.bottomView.bottom + NAV_HEIGHT)];
}

- (void)initUI{
    [self.bgScrollView addSubview:self.topView];
    [self.bgScrollView addSubview:self.centerView];
    [self.bgScrollView addSubview:self.bottomView];
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.with.equalTo(self.topView);
        make.top.equalTo(self.topView.mas_bottom).offset(10);
        make.height.equalTo(@44);
    }];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.with.equalTo(self.centerView);
        make.top.equalTo(self.centerView.mas_bottom).offset(10);
        make.height.equalTo(@600);
    }];
}

- (UIScrollView *)bgScrollView{
    if (!_bgScrollView){
        _bgScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        _bgScrollView.delegate = self;
        _bgScrollView.scrollEnabled = YES;
        _bgScrollView.showsVerticalScrollIndicator = YES;
    }
    return _bgScrollView;
}

- (UIView *)topView{
    if (!_topView){
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, - NAV_STATUS_HEIGHT, SCREEN_WIDTH, 150)];
        _topView.backgroundColor = [UIColor grayColor];
    }
    return _topView;
}

- (UIView *)centerView{
    if (!_centerView){
        _centerView = [[UIView alloc] init];
        _centerView.backgroundColor = [UIColor yellowColor];
    }
    return _centerView;
}

- (UIView *)bottomView{
    if (!_bottomView){
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor orangeColor];
    }
    return _bottomView;
}

- (UIView *)buyView{
    if (!_buyView){
        _buyView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 44.0, SCREEN_WIDTH, 44.0)];
        _buyView.backgroundColor = [UIColor whiteColor];
        UIButton *collectBtn = [[UIButton alloc] init];
        [collectBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        [collectBtn setBackgroundColor:[UIColor lightGrayColor]];
        [_buyView addSubview:collectBtn];
        
        UIButton *buyBtn = [[UIButton alloc] init];
        [buyBtn setTitle:@"购买" forState:UIControlStateNormal];
        [buyBtn setBackgroundColor:[UIColor darkGrayColor]];
        [_buyView addSubview:buyBtn];
        
        [buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_buyView.mas_right).offset(-5);
            make.top.bottom.equalTo(_buyView);
            make.width.equalTo(@100);
        }];
        
        [collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(buyBtn.mas_left).offset(-5);
            make.top.bottom.equalTo(buyBtn);
            make.width.equalTo(@100);
        }];
        
        [buyBtn bk_whenTapped:^{
            [self buyEvent];
        }];
        
        [collectBtn bk_whenTapped:^{
            [self collectEvent];
        }];
    }
    return _buyView;
}

- (void)buyEvent{
    
}

- (void)collectEvent{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
