//
//  CZLOperateSqlViewController.m
//  CZLPractice
//
//  Created by yuzeux on 2017/8/30.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import "CZLOperateSqlViewController.h"


@interface CZLOperateSqlViewController ()



@end

@implementation CZLOperateSqlViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"保存"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(saveValue:)];
  
    [[self navigationItem] setRightBarButtonItem:saveButton];
}

- (void)viewDidUnload {
    self.idValue = nil;
    self.textValue = nil;
    self.textName = nil;
    self.sqlValue = nil;
    [super viewDidUnload];
}

- (void)saveValue:(id)sender{
    
    if (self.idValue.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"请输入ID"
                                                       delegate:self
                                              cancelButtonTitle:@"好"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }    if (self.textValue.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"请输入电话"
                                                       delegate:self
                                              cancelButtonTitle:@"好"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }    if (self.textName.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"请输入姓名"
                                                       delegate:self
                                              cancelButtonTitle:@"好"
                                              otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    
    //初始化数据库
    CZLSQLiteApply *sqlSer = [[CZLSQLiteApply alloc] init];
    //数据库插入
    if (self.oprateType == 0) {
        
        sqlTestList *sqlInsert = [[sqlTestList alloc]init];
        sqlInsert.sqlID = [self.idValue.text intValue];
        sqlInsert.sqlText = self.textValue.text;
        sqlInsert.sqlname = self.textName.text;
        //调用封装好的数据库插入函数
        if ([sqlSer insertTestList:sqlInsert]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"插入数据成功"
                                                           delegate:self
                                                  cancelButtonTitle:@"好"
                                                  otherButtonTitles:nil];
            [alert show];
        }        else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"插入数据失败"
                                                           delegate:self
                                                  cancelButtonTitle:@"好"
                                                  otherButtonTitles:nil];
            [alert show];
            
        }
    }    //数据库更新
    if(self.oprateType == 1){
        
        sqlTestList *newValue = [[sqlTestList alloc]init];
        newValue.sqlID = [self.idValue.text intValue];
        newValue.sqlText = self.textValue.text;
        newValue.sqlname = self.textName.text;
        //调用封装好的更新数据库函数
        if ([sqlSer updateTestList:newValue]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"更新数据成功"
                                                           delegate:self
                                                  cancelButtonTitle:@"好"
                                                  otherButtonTitles:nil];
            [alert show];
        }        else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"更新数据失败"
                                                           delegate:self
                                                  cancelButtonTitle:@"好"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
    
}


@end
