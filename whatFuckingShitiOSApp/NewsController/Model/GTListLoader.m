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


-(void)loadListData
{
    //NSString * url = @"http://zjd-test-zbapi.vdyoo.cn/api/admin/live/detail?id=14";
    //NSURL *listURL = [NSURL URLWithString:url];
    
    
    [[AFHTTPSessionManager manager] GET:@"http://zjd-test-zbapi.vdyoo.cn/api/admin/live/list" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //NSError *jsonError;
        id jsonObj = responseObject;
        NSArray *dataArray = [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"data"]) objectForKey:@"data"];
        for (NSDictionary *info in dataArray) {
            GTListItem *list = [[GTListItem alloc] init];
            [list configWithDictionary:info];
        }
        NSLog(@"success");
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure");
    }];
    //NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
//    NSURLSession * session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"sss");
//    }];
//
//    [dataTask resume];
    NSLog(@"执行resume");
}


@end
