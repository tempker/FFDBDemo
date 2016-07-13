//
//  ViewController.m
//  FMDBDemo
//
//  Created by Tempker on 16/7/10.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "ViewController.h"
#import "FMDBTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //插入数据
    [FMDBTool insertfmdb_tableWithName:@"Tempker" withUserid:@"121" withAge:20];
    //[FMDBTool insertfmdb_tableWithName:@"你好啊" withUserid:@"123" withAge:18];
    
    //更新数据
   // [FMDBTool updatefmdb_tableWithUserid:@"123" withName:@"hahaha" withAge:14];
    
    
    //删除数据
    //[FMDBTool deletefmdb_tableWithUserid:@"123"];
    
    //查询数据
    
    NSArray *array = [FMDBTool selectfmdb_tablewithUserid:@"121"];
    
    NSLog(@"%@",array);
}




@end
