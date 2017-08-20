//
//  PurchaseViewController.m
//  platform
//
//  Created by chliu.brook on 27/06/2017.
//  Copyright © 2017 chliu.brook. All rights reserved.
//

#import "PurchaseViewController.h"

@interface PurchaseViewController ()

@property (nonatomic,strong) HMSegmentedControl *segmentCtrl;
@end

@implementation PurchaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = self.segmentCtrl;
}

- (HMSegmentedControl *)segmentCtrl{
    if (!_segmentCtrl){
        float topHeight = 20.0f;
        _segmentCtrl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, topHeight, SCREEN_WIDTH, NAV_HEIGHT - topHeight)];
        _segmentCtrl.sectionTitles = @[@"全部",@"待付款",@"待发货",@"待收货"];
        _segmentCtrl.selectedSegmentIndex = 0;
        _segmentCtrl.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
        _segmentCtrl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
        _segmentCtrl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1]};
        _segmentCtrl.selectionIndicatorColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1];
        _segmentCtrl.selectionStyle = HMSegmentedControlSelectionStyleArrow;
        _segmentCtrl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
//        [_segmentCtrl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
        [_segmentCtrl setIndexChangeBlock:^(NSInteger index) {
            
        }];
    }
    return _segmentCtrl;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
