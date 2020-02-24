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
//    NSArray<GTListItem *> *listdata = [self _readDataFromLocal];
//    if (listdata) {
//        finishBlock(YES, listdata);
//    }
    NSString *urlString = @"http://zjd-test-zbapi.vdyoo.cn/api/admin/live/list";
    NSURL *listURL = [NSURL URLWithString:urlString];

//    __unused NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];

    NSURLSession *session = [NSURLSession sharedSession];

    //__weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        
        //__strong typeof(weakSelf) strongSelf = weakSelf;
        
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        NSArray *dataArray =  [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"data"]) objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        
        
        for (NSDictionary *info in dataArray) {
            GTListItem *listItem = [[GTListItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        
        //[strongSelf _archiveListDataWithArray:listItemArray.copy];

        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error == nil, listItemArray.copy);
            }
        });
    }];

    [dataTask resume];
    
}


@end
