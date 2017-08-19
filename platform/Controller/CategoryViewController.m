//
//  CategoryViewController.m
//  platform
//
//  Created by chliu.brook on 17/08/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoryLeftCell.h"
#import "CategoryContentCell.h"
#import "CategoryLeftCell.h"

#define LEFTTVWIDTH 80

@interface CategoryViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    NSArray *leftArray;
    NSArray<NSArray *> *contentArray;
    NSMutableArray *contentDatas;
}
@property (nonatomic,strong) UISearchBar *searchView;
@property (nonatomic,strong) UITableView *leftTV;
@property (nonatomic,strong) UICollectionView *contentView;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.searchView;
    leftArray = @[@"新品推荐",@"中式",@"欧式",@"促销"];
    contentDatas = [NSMutableArray arrayWithCapacity:0];
    contentArray = @[@[@"hotSale1",@"hotSale2",@"hotSale3"],@[@"newP1",@"newP2",@"newP3"],@[@"topBanner2"],@[@"midBanner"]];
    [self.view addSubview:self.leftTV];
    [self.view addSubview:self.contentView];
    [self.leftTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.width.equalTo(@LEFTTVWIDTH);
        make.top.equalTo(self.view).offset(NAV_STATUS_HEIGHT);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftTV.mas_right).offset(5);
        make.right.equalTo(self.view.mas_right).offset(-5);
        make.top.equalTo(self.leftTV.mas_top).offset(5);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

- (UITableView *)leftTV{
    if (!_leftTV){
        _leftTV = [[UITableView alloc] init];
        _leftTV.backgroundColor = [UIColor clearColor];
        _leftTV.rowHeight = UITableViewAutomaticDimension;
        _leftTV.estimatedRowHeight = 44.0f;
        _leftTV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _leftTV.dataSource = self;
        _leftTV.delegate = self;
    }
    return _leftTV;
}

- (UICollectionView *)contentView{
    if (!_contentView){
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH - LEFTTVWIDTH)/4.0,60);
        flowLayout.minimumLineSpacing = 15;
        flowLayout.minimumInteritemSpacing = 15;
        flowLayout.sectionInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _contentView =[[UICollectionView alloc] initWithFrame:CGRectMake(100,100,10,10) collectionViewLayout:flowLayout];
        [_contentView registerClass:[CategoryContentCell class] forCellWithReuseIdentifier:@"CategoryContentCell"];
        _contentView.delegate = self;
        _contentView.dataSource = self;
        [_contentView setBackgroundColor:[UIColor clearColor]];
    }
    return _contentView;
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

#pragma mark UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return leftArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CategoryLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryLeftCell"] ;
    if (!cell){
        cell = [[CategoryLeftCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CategoryLeftCell"];
    }
    [cell updateData:[leftArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    contentDatas = [[contentArray objectAtIndex:indexPath.row] mutableCopy];
    [self.contentView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

#pragma mark - UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  contentDatas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryContentCell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[contentDatas objectAtIndex:indexPath.row]];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
