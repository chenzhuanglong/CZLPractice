//
//  CZLMineViewController.m
//  CZLPractice
//
//  Created by yuzeux on 2017/8/7.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import "CZLMineViewController.h"
#import "CZLSQLite3TestViewController.h"
#import "CZLTestViewController.h"

@interface CZLMineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *middleTableView;
@property (nonatomic, strong)NSArray *middleData;

@end

@implementation CZLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
    self.title = @"我的";
    
 
}
- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
}

- (UITableView *)middleTableView {
    if (!_middleTableView){
        UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,[[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height) style:UITableViewStylePlain];
        tableView.showsVerticalScrollIndicator = NO;
        tableView.showsHorizontalScrollIndicator = NO;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableView class])];
        [self.view addSubview:tableView];
        _middleTableView = tableView;
    }
    return _middleTableView;
}

- (NSArray *)middleData {
    if (!_middleData){
        NSArray *data = [NSArray array];
        _middleData = data;
    }
    return _middleData;
}

- (void)loadData {
    self.middleData = @[@"测试一",@"测试二",@"测试三",@"测试四",@"测试五",@"测试六"];
    [self.middleTableView reloadData];
}

#pragma mark - delegate 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.middleData.count;
};

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableView class])];
    cell.accessoryType    = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.middleData[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0){
        CZLTestViewController *testVC = [[CZLTestViewController alloc]init];
        testVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:testVC animated:YES];
     
    }else if(indexPath.row == 1){
        

    }

}






@end
