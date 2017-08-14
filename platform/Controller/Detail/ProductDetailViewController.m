//
//  ProductDetailViewController.m
//  platform
//
//  Created by chliu.brook on 13/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "ProductDetailViewController.h"

#define NAVBAR_CHANGE_POINT 50

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
    [self initNav];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.bgScrollView];
    [self initUI];
    [self.view addSubview:self.buyView];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController.navigationBar lt_reset];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.bgScrollView setContentSize:CGSizeMake(SCREEN_WIDTH, self.bottomView.bottom + NAV_HEIGHT)];
}

- (void)initNav{
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarClick)];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    self.navigationItem.title = @"";
}

- (void)leftBarClick{
    [self.navigationController popViewControllerAnimated:YES];
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
