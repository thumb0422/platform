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
@property (nonatomic,strong) HMSegmentedControl *segmentCtrl;
@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.bgScrollView];
    [self initUI];
    [self.view addSubview:self.buyView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
    [self.centerView addSubview:self.segmentCtrl];
    [self.segmentCtrl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.width.equalTo(self.centerView.mas_width);
        make.top.equalTo(@0);
        make.height.equalTo(self.centerView.mas_height).offset(-5);
    }];
    [self loadBottomSubView];
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
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, - NAV_STATUS_HEIGHT, SCREEN_WIDTH, 200)];
        _topView.backgroundColor = [UIColor clearColor];
        
        NSArray * topBannerArray = @[@"topBanner1.jpg",@"topBanner2.jpg",@"topBanner1.jpg",@"topBanner2.jpg"];
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, _topView.width, _topView.height - 50) shouldInfiniteLoop:YES imageNamesGroup:topBannerArray];
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        [_topView addSubview:cycleScrollView];
        
        UIView *descView = [[UIView alloc] initWithFrame:CGRectMake(0, cycleScrollView.height + 5, _topView.width, _topView.height - (cycleScrollView.height + 5))];
        descView.backgroundColor = [UIColor whiteColor];
        UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, descView.width, descView.height)];
        descLabel.text = @"这是一个测试用例，这是一个马桶，这是一个洗衣机,这是一个测试用例，这是一个马桶，这是一个洗衣机,这是一个测试用例，这是一个马桶，这是一个洗衣机,这是一个测试用例，这是一个马桶，这是一个洗衣机,这是一个测试用例，这是一个马桶，这是一个洗衣机,这是一个测试用例，这是一个马桶，这是一个洗衣机，这是一个洗衣机,这是一个测试用例，这是一个马桶，这是一个洗衣机，这是一个洗衣机,这是一个测试用例，这是一个马桶，这是一个洗衣机，这是一个洗衣机,这是一个测试用例，这是一个马桶，这是一个洗衣机，这是一个洗衣机,这是一个测试用例，这是一个马桶，这是一个洗衣机";
        descLabel.textColor = [UIColor blackColor];
        descLabel.font = [UIFont systemFontOfSize:14];
        descLabel.numberOfLines = 0;
        descLabel.adjustsFontSizeToFitWidth = YES;
        [descView addSubview:descLabel];
        [_topView addSubview:descView];
    }
    return _topView;
}

- (UIView *)centerView{
    if (!_centerView){
        _centerView = [[UIView alloc] init];
        _centerView.backgroundColor = [UIColor clearColor];
    }
    return _centerView;
}

- (HMSegmentedControl *)segmentCtrl{
    if (!_segmentCtrl){
        _segmentCtrl = [[HMSegmentedControl alloc] init];
        _segmentCtrl.sectionTitles = @[@"商品参数",@"商品详情"];
        _segmentCtrl.selectedSegmentIndex = 0;
        _segmentCtrl.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
        _segmentCtrl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
        _segmentCtrl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1]};
        _segmentCtrl.selectionIndicatorColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1];
        _segmentCtrl.selectionStyle = HMSegmentedControlSelectionStyleBox;
        _segmentCtrl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    }
    return _segmentCtrl;
}

- (UIView *)bottomView{
    if (!_bottomView){
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor clearColor];
    }
    return _bottomView;
}

- (void)loadBottomSubView{
    UIImageView *imgV1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"information"]];
    imgV1.contentMode = UIViewContentModeScaleAspectFit;
    [self.bottomView addSubview:imgV1];
    
    UIImageView *imgV2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"instructions"]];
    imgV2.contentMode = UIViewContentModeScaleAspectFit;
    [self.bottomView addSubview:imgV2];
    
    __weak typeof(self) weakSelf = self;
    [self.segmentCtrl setIndexChangeBlock:^(NSInteger index) {
        if (index == 0){
            [imgV2 setHidden:YES];
            [imgV1 setHidden:NO];
            [weakSelf.bottomView setFrame:CGRectMake(weakSelf.bottomView.left, weakSelf.bottomView.top, weakSelf.bottomView.width, imgV1.height)];
            [weakSelf.bgScrollView setContentSize:CGSizeMake(SCREEN_WIDTH, weakSelf.bottomView.bottom + NAV_HEIGHT)];
        }else {
            [imgV1 setHidden:YES];
            [imgV2 setHidden:NO];
            [weakSelf.bottomView setFrame:CGRectMake(weakSelf.bottomView.left, weakSelf.bottomView.top, weakSelf.bottomView.width, imgV2.height)];
            [weakSelf.bgScrollView setContentSize:CGSizeMake(SCREEN_WIDTH, weakSelf.bottomView.bottom + NAV_HEIGHT)];
        }
    }];
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

- (void) segmentChanged:(UISegmentedControl *)sender{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
