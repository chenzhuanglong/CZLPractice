//
//  CZLSQLiteApply.h
//  CZLPractice
//
//  Created by yuzeux on 2017/8/29.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

#define kFilename  @"testdb.db"
@class sqlTestList;

@interface CZLSQLiteApply : NSObject{
    sqlite3 *_database;
    
}

@property (nonatomic) sqlite3 *_database;
-(BOOL) createTestList:(sqlite3 *)db;//创建数据库
-(BOOL) insertTestList:(sqlTestList *)insertList;//插入数据
-(BOOL) updateTestList:(sqlTestList *)updateList;//更新数据
-(NSMutableArray*)getTestList;//获取全部数据
- (BOOL) deleteTestList:(sqlTestList *)deletList;//删除数据：
- (NSMutableArray*)searchTestList:(NSString*)searchString;//查询数据库，searchID为要查询数据的ID，返回数据为查询到的数据

@end

@interface sqlTestList : NSObject//重新定义了一个类，专门用于存储数据
{
    int sqlID;
    NSString *sqlText;
    NSString *sqlname;
}

@property (nonatomic) int sqlID;
@property (nonatomic, retain) NSString *sqlText;
@property (nonatomic, retain) NSString *sqlname;

@end
