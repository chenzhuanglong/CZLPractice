//
//  CZLHomeViewController.m
//  CZLPractice
//
//  Created by yuzeux on 2017/8/7.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import "CZLHomeViewController.h"


@interface CZLHomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray *data;

@end

@implementation CZLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.backgroundColor = [UIColor randomColor];
    [self.navigationController setNavigationBarHidden:YES];
}

- (NSMutableArray *)data {
    if (!_data){
        NSMutableArray *data = [NSMutableArray array];
        _data = data;
    }
    return _data;
}

- (UICollectionView *)collectionView {
    if (!_collectionView){
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0,100,100) collectionViewLayout:flowLayout];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        
        
        [self.view addSubview:collectionView];
        _collectionView = collectionView;
    }
    return _collectionView;
}




@end
