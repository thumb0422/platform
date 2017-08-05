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

@end

@implementation HomeViewController

-(void)awakeFromNib{
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
     [self wr_setNavBarBackgroundAlpha:0];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > -80)
    {
        [self changeNavBarAnimateWithIsClear:NO];
    }
    else
    {
        [self changeNavBarAnimateWithIsClear:YES];
    }
}

- (void)changeNavBarAnimateWithIsClear:(BOOL)isClear
{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.6 animations:^
     {
         __strong typeof(self) pThis = weakSelf;
         if (isClear == YES) {
             [pThis wr_setNavBarBackgroundAlpha:0];
         } else {
             [pThis wr_setNavBarBackgroundAlpha:1.0];
         }
     }];
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
    /*
    if (indexPath.row == 0){
        cell = (HomeHeaderCell *)cell;
        cell.cellClickBlock = ^(ProductInfoModel *data) {
            dataModel = data;
            UIStoryboard *detailSB = [UIStoryboard storyboardWithName:@"Detail" bundle:nil];
            UIViewController * nextVC = [detailSB instantiateViewControllerWithIdentifier:@"DetailViewController"];
            [self.navigationController pushViewController:nextVC animated:YES];
        };
    }
    */
    switch (indexPath.row) {
        case 0:
            cell = (HomeHeaderCell *)cell;
            cell.cellClickBlock = ^(ProductInfoModel *data) {
                dataModel = data;
            };
            break;
        case 1:
            cell = (HomeCollectionTableViewCell *)cell;
            cell.cellClickBlock = ^(ProductInfoModel *data) {
                dataModel = data;
            };
            break;
        case 2:
            cell = (HomeImageTableViewCell *)cell;
            cell.imageView.image = [UIImage imageNamed:@"topBanner2.jpg"];
            cell.cellClickBlock = ^(ProductInfoModel *data) {
                dataModel = data;
            };
            break;
        case 3:
            {
                HomeTopBottomTableViewCell *tmpCell = (HomeTopBottomTableViewCell *)cell;
                tmpCell.imageArray = @[@"hotSale1.png",@"hotSale2.png",@"hotSale3.png"];
                tmpCell.cellClickBlock = ^(ProductInfoModel *data) {
                    dataModel = data;
                };
                return tmpCell;
            }
            break;
        case 4:
            cell = (HomeImageTableViewCell *)cell;
            cell.imageView.image = [UIImage imageNamed:@"midBanner.png"];
            cell.cellClickBlock = ^(ProductInfoModel *data) {
                dataModel = data;
            };
            break;
        case 5:
        {
            HomeCompsiteTableViewCell *tmpCell = (HomeCompsiteTableViewCell *)cell;
            tmpCell.imageArray = @[@"newP1",@"newP2",@"newP3",@"newP4",@"newP5"];
            cell.cellClickBlock = ^(ProductInfoModel *data) {
                NSLog(@"111---name=%@,tag=%@",data.productName,data.productId);
            };
            return tmpCell;
        }
            break;
        default:
            break;
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
