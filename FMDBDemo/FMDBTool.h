//
//  FMDBTool.h
//  FMDBDemo
//
//  Created by Tempker on 16/7/10.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMDBTool : NSObject


//添加数据
+(void)insertfmdb_tableWithName:(NSString *)name withUserid:(NSString *)userid withAge:(NSInteger)age;

//删除数据
+(void)deletefmdb_tableWithUserid:(NSString *)userid;

//更新数据
+(void)updatefmdb_tableWithUserid:(NSString *)userid withName:(NSString *)name withAge:(NSInteger)age;

//查询数据
+(NSArray*)selectfmdb_tablewithUserid:(NSString *)userid;

@end
