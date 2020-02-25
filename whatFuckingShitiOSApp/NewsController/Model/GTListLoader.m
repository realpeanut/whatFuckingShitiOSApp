//
//  GTListLoader.m
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/21.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "GTListLoader.h"
#import <AFNetworking.h>
#import "GTListItem.h"


@implementation GTListLoader


-(void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock{

    NSString *urlString = @"http://zjd-test-zbapi.vdyoo.cn/api/admin/live/list";
    NSURL *listURL = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
    
        NSArray *dataArray =  [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"data"]) objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        
        
        for (NSDictionary *info in dataArray) {
            GTListItem *listItem = [[GTListItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error == nil, listItemArray.copy);
            }
        });
    }];

    [dataTask resume];
    [self _getSandBoxPath];
    
}

-(void)_getSandBoxPath
{
    //获取缓存文件目录
    NSArray  *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    //创建fileManager
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //创建CachePeanut文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"CachePeanut"];
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:Nil error:&createError];
    
    //在文件夹中创建文件filePeanut
    NSString *filePeanut = [dataPath stringByAppendingPathComponent:@"filePeanut"];
    //文件内容
    NSData *content = [@"文件内容" dataUsingEncoding:NSUTF8StringEncoding];
    //开始创建文件
    [fileManager createFileAtPath:filePeanut contents:content attributes:nil];
    
    //判断文件是否存在
    BOOL fileExist= [fileManager fileExistsAtPath:filePeanut];
    
    //删除文件
    if (fileExist) {
        [fileManager removeItemAtPath:filePeanut error:nil];
    }
    NSLog(@"获取目录");
}


@end
