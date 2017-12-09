//
//  CZLSQLite3TestViewController.m
//  CZLPractice
//
//  Created by yuzeux on 2017/8/30.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import "CZLSQLite3TestViewController.h"
#import "CZLOperateSqlViewController.h"
#import "CZLSQLiteApply.h"

@interface CZLSQLite3TestViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CZLSQLite3TestViewController

@synthesize utableView;
@synthesize listData;
@synthesize searchBar;

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CZLSQLiteApply *sqlSer = [[CZLSQLiteApply alloc] init];
    listData = [sqlSer getTestList];//先初始化那个专门用于存数据的类，才调用类获取数据的方法
    
}

- (void)viewDidAppear:(BOOL)animated{//在这里写是为了等待时间缩短一点，数据如果很多的，在这里写可以让数据提前加载
    CZLSQLiteApply *sqlSer = [[CZLSQLiteApply alloc] init];
    listData = [sqlSer getTestList];
    [utableView reloadData];
}


- (void)viewDidUnload {
    utableView = nil;
    listData = nil;
    searchBar = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (IBAction)insertValue{
    
    [searchBar resignFirstResponder];//触发这个insertValue方法时隐藏键盘
    CZLOperateSqlViewController *operateController = [[CZLOperateSqlViewController alloc] init ];
    UINavigationController *theNavController = [[UINavigationController alloc]
                                                initWithRootViewController:operateController];//这里如果不初始化一个UINavigationController类的对象来存放operateSqlViewController类的UIViewController，就不会有最上面的导航栏了。
    operateController.oprateType = 0;//optrateType为0时为数据插入
    theNavController.navigationBar.tintColor = [UIColor blackColor];
    [self presentViewController:theNavController animated:YES completion:nil];

}

- (IBAction)updateValue {
    
    [searchBar resignFirstResponder];
    NSIndexPath *indexPath = [utableView  indexPathForSelectedRow];
    if (indexPath == nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"请选择要更新的项"
                                                       delegate:self
                                              cancelButtonTitle:@"好"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    NSUInteger row = [indexPath row];
    sqlTestList *sqlList = [[sqlTestList alloc]init];
    sqlList = [listData objectAtIndex:(row - 1)];//在这里面获取点击的行，因为table的第一行没显示数据，所以这里要减1。
    
    CZLOperateSqlViewController *operateController = [[CZLOperateSqlViewController alloc] init ];
    UINavigationController *theNavController = [[UINavigationController alloc]
                                                initWithRootViewController:operateController];
    operateController.oprateType = 1;//optrateType为1时为数据更新
    operateController.sqlValue = sqlList;
    theNavController.navigationBar.tintColor = [UIColor blackColor];
    [self presentViewController:theNavController animated:YES completion:nil];
}

- (IBAction)getAllValue{
    
    [searchBar resignFirstResponder];
    
    CZLSQLiteApply *sqlSer = [[CZLSQLiteApply alloc] init];
    listData = [sqlSer getTestList];
    [utableView reloadData];

    
}
- (IBAction)deleteValue{
    
    [searchBar resignFirstResponder];
    
    NSIndexPath *indexPath = [utableView  indexPathForSelectedRow];
    
    if (indexPath == nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"请选择要删除的项"
                                                       delegate:self
                                              cancelButtonTitle:@"好"
                                              otherButtonTitles:nil];
        [alert show];

        return;
    }
    
    NSUInteger row = [indexPath row];
    sqlTestList *sqlList = [[sqlTestList alloc]init];
    sqlList = [listData objectAtIndex:(row - 1)];
    
    CZLSQLiteApply *sqlSer = [[CZLSQLiteApply alloc] init];
    
    if ([sqlSer deleteTestList:sqlList]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"删除数据成功"
                                                       delegate:self
                                              cancelButtonTitle:@"好"
                                              otherButtonTitles:nil];
        [alert show];
        
        //删除成功后重新获取数据更新列表
        listData = [sqlSer getTestList];
        [utableView reloadData];
        
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"删除数据失败"
                                                       delegate:self
                                              cancelButtonTitle:@"好"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
   
}
- (IBAction)searchValue{
    
    if ([searchBar.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"请输入要查询数据的ID"
                                                       delegate:self
                                              cancelButtonTitle:@"好"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    else {
        //        int idNum = [searchBar.text intValue];
        NSString *str = searchBar.text;
        CZLSQLiteApply *sqlSer = [[CZLSQLiteApply alloc] init];
        listData = [sqlSer searchTestList:str];
        
        if ([listData  count] == 0) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"sorry,未查询到数据，请查看name是否有误"
                                                           delegate:self
                                                  cancelButtonTitle:@"好"
                                                  otherButtonTitles:nil];
            [alert show];
  
            return;
        }
        [searchBar resignFirstResponder];
        [utableView reloadData];
        
    }
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [listData count] + 1;//从第二行开始，第一行不显示数据
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *CustomIdentifier =  [NSString stringWithFormat:@"cell%ld",(long)indexPath.row];
    //cell不重用
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomIdentifier];
    if (indexPath.row == 0)
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                       reuseIdentifier:CustomIdentifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    if (indexPath.row > 0)
    {
        NSUInteger row = [indexPath row];
        sqlTestList *sqlList = [[sqlTestList alloc] init] ;
        
        if (listData != nil)
            sqlList = [listData objectAtIndex: (row - 1)];//读取数据的时候也要减一行，从第二行开始
        
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0+40, 10, 70, 30)];
        UILabel *IDLabel = [[UILabel alloc]initWithFrame:CGRectMake(90+40, 10, 70, 30)];
        UILabel *valueLabel = [[UILabel alloc]initWithFrame:CGRectMake(180+40, 10, 70, 30)];
        nameLabel.text = sqlList.sqlname;
        IDLabel.text = sqlList.sqlText;
        valueLabel.text = [NSString stringWithFormat:@"%d",sqlList.sqlID];
        [cell.contentView addSubview:nameLabel];
        [cell.contentView addSubview:IDLabel];
        [cell.contentView addSubview:valueLabel];
    }
    else
    {
        for (int i = 0; i < 3; i ++) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(90 * i + 40, 10, 70 , 30)];
            NSArray *array = [NSArray arrayWithObjects:@"姓名",@"ID",@"电话", nil];
            label.text = [array objectAtIndex:i];
            label.backgroundColor = [UIColor clearColor];
            [cell.contentView addSubview:label];
        }
    }
    return cell;
}

- (NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [searchBar resignFirstResponder];
    if (indexPath.row == 0) {
        return nil;//让第一行不能点击
    }
    else
        return indexPath;
}

@end
