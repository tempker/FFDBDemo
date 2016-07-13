//
//  FMDBTool.m
//  FMDBDemo
//
//  Created by Tempker on 16/7/10.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "FMDBTool.h"
#import <FMDB.h>

@implementation FMDBTool


static FMDatabase *_db;

+(void)load{
    //1.获取沙盒存储路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingString:@"deal.sqlite"];
    //2.创建数据库
    _db = [FMDatabase databaseWithPath:path];
    NSLog(@"path:%@",path);
    
    //3.判断是否打开
    if (![_db open]) {
        return;
    }
    //4.创建表
    [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS fmdb_table (id integer PRIMARYKEY,name text not null,age integer,userid text)"];
}
//添加数据
+(void)insertfmdb_tableWithName:(NSString *)name withUserid:(NSString *)userid withAge:(NSInteger)age{
    
    [_db executeUpdateWithFormat:@"INSERT INTO fmdb_table (name,age,userid) VALUES (%@,%@,%@);",name,[NSNumber numberWithInteger:age],userid];
}

//删除数据
+(void)deletefmdb_tableWithUserid:(NSString *)userid{
    
    NSString *delete = [NSString stringWithFormat:@"DELETE FROM fmdb_table WHERE userid='%@';",userid];
    [_db executeUpdate:delete];
}

//更新数据
+(void)updatefmdb_tableWithUserid:(NSString *)userid withName:(NSString *)name withAge:(NSInteger)age{
    
    NSString *update = [NSString stringWithFormat:@"UPDATE fmdb_table WHERE userid = '%@';",userid];
    [_db executeUpdate:update];
}

//查询数据
+(NSArray *)selectfmdb_tablewithUserid:(NSString *)userid{
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    NSString *sql = [NSString stringWithFormat:@"SELECT name FROM fmdb_table WHERE userid = '%@';",userid];
    
    FMResultSet *set = [_db executeQuery:sql];
    
    while ([set next]) {
        
        NSString *name = [set stringForColumn:@"name"];
        
        [tempArray addObject:name];
    }
    return tempArray.copy;
}

@end
