//
//  CZLOperateSqlViewController.h
//  CZLPractice
//
//  Created by yuzeux on 2017/8/30.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import "CZLBaseViewController.h"
#import "CZLSQLiteApply.h"

@interface CZLOperateSqlViewController : CZLBaseViewController
@property (nonatomic, strong) UITextField *idValue;
@property (nonatomic, strong) UITextField *textValue;
@property (nonatomic, strong) UITextField *textName;
@property (nonatomic, strong) sqlTestList *sqlValue;
@property (nonatomic) int oprateType;
@end
