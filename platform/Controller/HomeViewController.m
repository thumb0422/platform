//
//  HomeViewController.m
//  platform
//
//  Created by chliu.brook on 13/07/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "HomeViewController.h"

#import "HomeHeaderCell.h"
#import "HomeCollectionTableViewCell.h"
#import "HomeImageTableViewCell.h"
#import "HomeTopBottomTableViewCell.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_identifyArray;
}

@end

@implementation HomeViewController

-(void)awakeFromNib{
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _identifyArray = @[@"HomeHeaderCell",@"HomeCollectionTableViewCell",@"HomeImageTableViewCell",@"HomeTopBottomTableViewCell",@"HomeImageTableViewCell"];
    [_identifyArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.mainTV registerNib:[UINib nibWithNibName:obj bundle:nil] forCellReuseIdentifier:obj];
    }];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell = (HomeHeaderCell *)cell;
            break;
        case 1:
            cell = (HomeCollectionTableViewCell *)cell;
            break;
        case 2:
            cell = (HomeImageTableViewCell *)cell;
            cell.imageView.image = [UIImage imageNamed:@"topBanner2.jpg"];
            break;
        case 3:
            cell = (HomeTopBottomTableViewCell *)cell;
            break;
        case 4:
            cell = (HomeImageTableViewCell *)cell;
            cell.imageView.image = [UIImage imageNamed:@"midBanner.png"];
            break;
            
        default:
            break;
    }
    
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
