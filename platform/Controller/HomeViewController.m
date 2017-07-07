//
//  HomeViewController.m
//  platform
//
//  Created by chliu.brook on 27/06/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "HomeViewController.h"
#import "RFLayout.h"
#import "HomeCollectionCell.h"
static NSString *homeCollectionCellIdentifier = @"HomeCollectionCell";

@interface HomeViewController ()<SDCycleScrollViewDelegate,UICollectionViewDataSource, UICollectionViewDelegate>{
    NSArray *_topBannerArray;
    NSArray *_hotSaleArray;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //headerView
    _topBannerArray = @[@"topBanner1.jpg",@"topBanner2.jpg"];
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.headerView.frame.size.height) shouldInfiniteLoop:YES imageNamesGroup:_topBannerArray];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.headerView addSubview:cycleScrollView];
    [self.headerView setBackgroundColor:[UIColor clearColor]];
    
    //collectionView
    _hotSaleArray = @[@"hotSale1.jpg",@"hotSale2.jpg",@"hotSale1.jpg",@"hotSale2.jpg",@"hotSale1.jpg",@"hotSale2.jpg"];
    [self.headerCollectionView registerNib:[UINib nibWithNibName:homeCollectionCellIdentifier bundle:nil] forCellWithReuseIdentifier:homeCollectionCellIdentifier];
    self.headerCollectionView.collectionViewLayout = [[RFLayout alloc] init];
    self.headerCollectionView.backgroundColor = [UIColor clearColor];
    self.headerCollectionView.tag = 1001;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
//    [self.navigationController pushViewController:[NSClassFromString(@"DemoVCWithXib") new] animated:YES];
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _hotSaleArray.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:homeCollectionCellIdentifier forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[_hotSaleArray objectAtIndex:indexPath.row]];
    return cell;
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
