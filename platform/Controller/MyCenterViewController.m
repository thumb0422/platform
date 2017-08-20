//
//  MyCenterViewController.m
//  platform
//
//  Created by chliu.brook on 27/06/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "MyCenterViewController.h"
@interface MyCenterViewController ()<UITableViewDelegate,UITableViewDataSource>{
    BOOL _isLogin;
    NSArray *_settingArray;
}
@property (nonatomic,strong) UIImageView *topImg;
@property (nonatomic,strong) UIImageView *topLogImg;
@property (nonatomic,strong) UITableView *tv;
@property (nonatomic,strong) UIButton *topRegistBtn;
@end

@implementation MyCenterViewController

- (void)initTopView {
    UIImageView *topImgTmp = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"my_bg"]];
    topImgTmp.contentMode = UIViewContentModeScaleToFill;
    topImgTmp.alpha = 0.8;
    self.topImg = topImgTmp;
    self.topImg.userInteractionEnabled = YES;
    [self.view addSubview:self.topImg];
    [self.topImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@200);
    }];
    
    UIImageView *topLogImgTmp = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"my_logo"]];
    topLogImgTmp.contentMode = UIViewContentModeScaleAspectFit;
    self.topLogImg = topLogImgTmp;
    self.topLogImg.userInteractionEnabled = YES;
    [self.topImg addSubview:self.topLogImg];
    [self.topLogImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.topImg.mas_centerX);
        make.width.equalTo(@80);
        make.height.equalTo(@80);
        make.centerY.equalTo(self.topImg.mas_centerY);
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypePlain];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.topRegistBtn = btn;
    [self.topImg addSubview:self.topRegistBtn];
    [self.topRegistBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.topImg.mas_centerX);
        make.width.equalTo(@100);
        make.height.equalTo(@44);
        make.top.equalTo(self.topLogImg.mas_bottom).offset(5);
    }];
    [self.topRegistBtn bk_whenTapped:^{
        if (_isLogin){
            UIViewController *nextVC = SelfSBVC(@"Login", @"SettingViewController");
            [self.navigationController pushViewController:nextVC animated:NO];
        }else{
            UIViewController *nextVC = SelfSBVC(@"Login", @"LoginViewController");
            [self.navigationController pushViewController:nextVC animated:NO];
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _settingArray = @[@"我的订单",@"收获地址",@"反馈"];
    [self initTopView];
    [self.view addSubview:self.tv];
    [self.tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.topImg.mas_bottom).equalTo(@15);
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    _isLogin = [UserManager getInstance].userModel.isLogin;
    [self.topRegistBtn setTitle:_isLogin ? [NSString stringWithFormat:@"%@已登录",[UserManager getInstance].userModel.mobileNo ]:@"点击登录" forState:UIControlStateNormal];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (UITableView *)tv{
    if (!_tv){
        _tv = [[UITableView alloc] init];
        _tv.backgroundColor = [UIColor clearColor];
        _tv.rowHeight = UITableViewAutomaticDimension;
        _tv.estimatedRowHeight = 44.0f;
        _tv.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tv.dataSource = self;
        _tv.delegate = self;
    }
    return _tv;
}

#pragma mark UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _settingArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"] ;
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    cell.textLabel.text = [_settingArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    contentDatas = [[contentArray objectAtIndex:indexPath.row] mutableCopy];
//    [self.contentView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
