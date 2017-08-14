//
//  HomeViewController.m
//  platform
//
//  Created by chliu.brook on 13/07/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeHeaderCell.h"
#import "BaseTableViewCell.h"
#import "HomeCollectionTableViewCell.h"
#import "HomeImageTableViewCell.h"
#import "HomeTopBottomTableViewCell.h"
#import "HomeCompsiteTableViewCell.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_identifyArray;
    NSArray *_rowHeightArray;
}

@property (nonatomic,strong) UISearchBar *searchView;
@end

@implementation HomeViewController

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTV.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    _rowHeightArray = @[[NSNumber numberWithInteger:200],[NSNumber numberWithInteger:200],[NSNumber numberWithInteger:200],[NSNumber numberWithInteger:400],[NSNumber numberWithInteger:200],[NSNumber numberWithInteger:700]];
    _identifyArray = @[@"HomeHeaderCell",@"HomeCollectionTableViewCell",@"HomeImageTableViewCell",@"HomeTopBottomTableViewCell",@"HomeImageTableViewCell",@"HomeCompsiteTableViewCell"];
    [_identifyArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.mainTV registerNib:[UINib nibWithNibName:obj bundle:nil] forCellReuseIdentifier:obj];
    }];
    self.mainTV.allowsSelection = NO;
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    self.navigationItem.titleView = self.searchView;
}

- (UISearchBar *)searchView{
    if (!_searchView){
        _searchView = [[UISearchBar alloc] init];
        _searchView.backgroundColor = [UIColor clearColor];
        _searchView.placeholder = @"搜索";
        _searchView.delegate = self;
        [_searchView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAV_HEIGHT)];
        
        [_searchView updateBGClear:[UIColor clearColor]];
    }
    return _searchView;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _identifyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identify = [_identifyArray objectAtIndex:indexPath.row];
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    __block ProductInfoModel *dataModel = nil;
    
    if (indexPath.row == 0){
        cell = (HomeHeaderCell *)cell;
        cell.cellClickBlock = ^(ProductInfoModel *data) {
            dataModel = data;
            UIViewController *dtlVC = SelfSBVC(@"Detail", @"ProductDetailViewController");
            [self.navigationController pushViewController:dtlVC animated:YES];
        };
    }else if (indexPath.row == 1){
        cell = (HomeCollectionTableViewCell *)cell;
        cell.cellClickBlock = ^(ProductInfoModel *data) {
            dataModel = data;
        };
    }else if (indexPath.row == 2){
        cell = (HomeImageTableViewCell *)cell;
        cell.imageView.image = [UIImage imageNamed:@"topBanner2.jpg"];
        cell.cellClickBlock = ^(ProductInfoModel *data) {
            dataModel = data;
        };
    }else if (indexPath.row == 3){
        {
            HomeTopBottomTableViewCell *tmpCell = (HomeTopBottomTableViewCell *)cell;
            tmpCell.imageArray = @[@"hotSale1.png",@"hotSale2.png",@"hotSale3.png"];
            tmpCell.cellClickBlock = ^(ProductInfoModel *data) {
                dataModel = data;
            };
            return tmpCell;
        }
    }else if (indexPath.row == 4){
        cell = (HomeImageTableViewCell *)cell;
        cell.imageView.image = [UIImage imageNamed:@"midBanner.png"];
        cell.cellClickBlock = ^(ProductInfoModel *data) {
            dataModel = data;
        };
    }else if (indexPath.row == 5){
        HomeCompsiteTableViewCell *tmpCell = (HomeCompsiteTableViewCell *)cell;
        tmpCell.imageArray = @[@"newP1",@"newP2",@"newP3",@"newP4",@"newP5"];
        cell.cellClickBlock = ^(ProductInfoModel *data) {
            NSLog(@"111---name=%@,tag=%@",data.productName,data.productId);
        };
    }else {
        
    }
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[_rowHeightArray objectAtIndex:indexPath.row] integerValue];
}

/*点击事件在 cellForRowAtIndexPath.block 中，此处不处理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
