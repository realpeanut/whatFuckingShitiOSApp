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

//    NSArray<GTListItem*>* listData = [self loadDataFromLocal];
//    if (listData) {
//        finishBlock(YES, listData);
//        NSLog(@"从本地取数据");
//    }
    
    NSString *urlString = @"http://learn.laravel.com/api/live/list";
    NSURL *listURL = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    __weak typeof(self) weakSelf= self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        __strong typeof(weakSelf) StrongSelf = weakSelf;
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
    
        NSArray *dataArray =  [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"data"]) objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        
        
        for (NSDictionary *info in dataArray) {
            GTListItem *listItem = [[GTListItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        
        [weakSelf _archiveListDataWithArray:listItemArray.copy];

        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error == nil, listItemArray.copy);
            }
        });
    }];

    [dataTask resume];
    
}

-(NSArray<GTListItem*>*)loadDataFromLocal
{
    NSArray  *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"CachePeanut/filePeanut"];
    //创建fileManager
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSData *readList = [fileManager contentsAtPath:dataPath];
    //反序列化
    id unarchivObj  = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:readList error:nil];
    if ([unarchivObj isKindOfClass:[NSArray class]] && [unarchivObj count] > 0) {
        return (NSArray<GTListItem*>*)unarchivObj;
    }
    return Nil;
}

-(void)_archiveListDataWithArray:(NSArray<GTListItem*> *)array
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
    //序列化
    NSData *content = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:Nil];
    //NSData *content = [@"文件内容" dataUsingEncoding:NSUTF8StringEncoding];
    //开始创建文件
    [fileManager createFileAtPath:filePeanut contents:content attributes:nil];
    
    //读取文件内容
    //NSData *readList = [fileManager contentsAtPath:filePeanut];
    //反序列化
    //id unarchivObj  = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:readList error:nil];
    
    //NSUserDefaults *ndf = [NSUserDefaults standardUserDefaults];
    
    //[ndf setObject:@"存取内容" forKey:@"ourKey"];
    //NSString * contents = [ndf stringForKey:@"ourKey"];
    //NSLog(@"%@",contents);
    //判断文件是否存在
//    BOOL fileExist= [fileManager fileExistsAtPath:filePeanut];
    
//    //删除文件
//    if (fileExist) {
//        [fileManager removeItemAtPath:filePeanut error:nil];
//    }
//    //在文件末尾追加内容
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePeanut];
//    //文件指针指向末尾
//    [fileHandle seekToEndOfFile];
//    NSString *addContent = @"这是追加的内容";
//    //设置utf8编码并进行内容追加写入
//    [fileHandle writeData:[addContent dataUsingEncoding:NSUTF8StringEncoding]];
//    //刷新文件
//    [fileHandle synchronizeFile];
//    //关闭文件句柄
//    [fileHandle closeFile];
}


@end
